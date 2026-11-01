import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_mom/database/portable_backup.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';

void main() {
  test(
    'encrypted backup restores all stores; bad password and tampering do not change data',
    () async {
      final factory = newDatabaseFactoryMemory();
      final source = await factory.openDatabase('source');
      final target = await factory.openDatabase('target');
      await intMapStoreFactory.store('calIBW').add(source, {
        'weight': 'private-health-record',
      });
      await intMapStoreFactory.store('breakfast').add(source, {
        'protein': '23',
      });
      await intMapStoreFactory.store('transaction').add(target, {
        'value': 'keep until confirmed',
      });
      final backup = PortableBackup();
      final bytes = await backup.create(source, 'long unique password');
      expect(utf8.decode(bytes), isNot(contains('private-health-record')));
      await expectLater(
        backup.decrypt(bytes, 'incorrect password'),
        throwsA(anything),
      );
      final envelope = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
      final ciphertext = base64Decode(envelope['data'] as String);
      ciphertext[ciphertext.length - 1] ^= 1;
      envelope['data'] = base64Encode(ciphertext);
      final altered = Uint8List.fromList(utf8.encode(jsonEncode(envelope)));
      await expectLater(
        backup.decrypt(altered, 'long unique password'),
        throwsA(anything),
      );
      expect(
        (await intMapStoreFactory.store('transaction').find(target))
            .single
            .value['value'],
        'keep until confirmed',
      );
      final imported = await backup.decrypt(bytes, 'long unique password');
      await backup.restore(target, imported);
      expect(
        (await intMapStoreFactory.store('calIBW').find(target))
            .single
            .value['weight'],
        'private-health-record',
      );
      expect(
        (await intMapStoreFactory.store('breakfast').find(target))
            .single
            .value['protein'],
        '23',
      );
    await intMapStoreFactory.store('calIBW').add(target, {'weight': 'next'});
    expect((await intMapStoreFactory.store('calIBW').find(target)).length, 2);
      expect(
        await intMapStoreFactory.store('transaction').find(target),
        isEmpty,
      );
      await source.close();
      await target.close();
    },
    timeout: const Timeout(Duration(minutes: 3)),
  );

  test('rejects unrecognized records before changing database', () async {
    final factory = newDatabaseFactoryMemory();
    final db = await factory.openDatabase('target');
    await intMapStoreFactory.store('calIBW').add(db, {'weight': 70});
    await expectLater(
      PortableBackup().restore(db, {
        'sembast_export': 1,
        'version': 1,
        'stores': [
          {
            'name': 'other',
            'keys': [1],
            'values': [{}],
          },
        ],
      }),
      throwsFormatException,
    );
    expect(
      (await intMapStoreFactory.store('calIBW').find(db))
          .single
          .value['weight'],
      70,
    );
    await db.close();
  });
}

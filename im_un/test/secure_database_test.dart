import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import 'package:project_mom/database/secure_database.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

void main() {
  late Directory directory;
  late String oldPath;
  String? key;
  SecureDatabaseManager manager() => SecureDatabaseManager(
    readKey: () async => key,
    writeKey: (value) async => key = value,
  );

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('imun-security-test-');
    oldPath = path.join(directory.path, 'records.db');
    key = null;
  });
  tearDown(() async => directory.delete(recursive: true));

  test(
    'migrates existing records, encrypts contents and survives reopen',
    () async {
      final original = await databaseFactoryIo.openDatabase(oldPath);
      await intMapStoreFactory.store('calIBW').add(original, {
        'weight': 'unique-health-value-123',
      });
      await intMapStoreFactory.store('breakfast').add(original, {
        'protein': '20',
      });
      await original.close();

      final first = manager();
      final db = await first.open(oldPath);
      expect(
        (await intMapStoreFactory.store('calIBW').find(db))
            .single
            .value['weight'],
        'unique-health-value-123',
      );
      expect(await File(oldPath).exists(), isFalse);
      expect(
        await File('$oldPath.secure').readAsString(),
        isNot(contains('unique-health-value-123')),
      );
      await first.close();

      final second = manager();
      final reopened = await second.open(oldPath);
      expect(
        (await intMapStoreFactory.store('breakfast').find(reopened))
            .single
            .value['protein'],
        '20',
      );
      await second.close();
    },
  );

  test('missing or incorrect key never overwrites encrypted data', () async {
    final first = manager();
    final db = await first.open(oldPath);
    await intMapStoreFactory.store('records').add(db, {'value': 'keep-me'});
    await first.close();
    final before = await File('$oldPath.secure').readAsBytes();
    final correct = key;
    key = null;
    await expectLater(manager().open(oldPath), throwsStateError);
    expect(await File('$oldPath.secure').readAsBytes(), before);
    key = base64Encode(List<int>.filled(32, 7));
    await expectLater(manager().open(oldPath), throwsA(anything));
    expect(await File('$oldPath.secure').readAsBytes(), before);
    key = correct;
    final recovered = manager();
    expect(
      (await intMapStoreFactory
              .store('records')
              .find(await recovered.open(oldPath)))
          .single
          .value['value'],
      'keep-me',
    );
    await recovered.close();
  });

  test(
    'failure to persist key leaves the original database untouched',
    () async {
      final original = await databaseFactoryIo.openDatabase(oldPath);
      await intMapStoreFactory.store('records').add(original, {
        'value': 'original',
      });
      await original.close();
      final failing = SecureDatabaseManager(
        readKey: () async => null,
        writeKey: (_) async => throw StateError('storage failure'),
      );
      await expectLater(failing.open(oldPath), throwsStateError);
      expect(await File(oldPath).exists(), isTrue);
      expect(await File('$oldPath.secure').exists(), isFalse);
      final check = await databaseFactoryIo.openDatabase(oldPath);
      expect(
        (await intMapStoreFactory.store('records').find(check))
            .single
            .value['value'],
        'original',
      );
      await check.close();
    },
  );

  test(
    'resumes an interrupted migration without discarding the old file',
    () async {
      final original = await databaseFactoryIo.openDatabase(oldPath);
      await intMapStoreFactory.store('records').add(original, {
        'value': 'saved',
      });
      await original.close();
      final originalBytes = await File(oldPath).readAsBytes();
      final first = manager();
      await first.open(oldPath);
      await first.close();
      // Simulates a process stopping after the encrypted copy was renamed but
      // before the old database was removed.
      await File(oldPath).writeAsBytes(originalBytes);
      final resumed = manager();
      final db = await resumed.open(oldPath);
      expect(
        (await intMapStoreFactory.store('records').find(db))
            .single
            .value['value'],
        'saved',
      );
      expect(await File(oldPath).exists(), isFalse);
      await resumed.close();
    },
  );
}

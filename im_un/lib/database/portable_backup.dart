import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/sembast_import_export.dart';

/// Portable authenticated backup. Only ciphertext is ever written to a file.
class PortableBackup {
  static const int maxBytes = 10 * 1024 * 1024;
  static const int iterations = 600000;
  static const _stores = {
    'transaction',
    'calIBW',
    'calProtein',
    'breakfast',
    'lunch',
    'dinner',
  };

  Future<SecretKey> _key(String password, List<int> salt) => Pbkdf2.hmacSha256(
    iterations: iterations,
    bits: 256,
  ).deriveKey(secretKey: SecretKey(utf8.encode(password)), nonce: salt);

  Future<Uint8List> create(Database db, String password) async {
    if (password.length < 12) throw ArgumentError('Password too short');
    final plain = utf8.encode(jsonEncode(await exportDatabase(db)));
    if (plain.length > maxBytes ~/ 2) throw FormatException('Backup too large');
    final random = Random.secure();
    final salt = List<int>.generate(16, (_) => random.nextInt(256));
    final key = await _key(password, salt);
    final box = await AesGcm.with256bits().encrypt(
      plain,
      secretKey: key,
      aad: utf8.encode('imun-backup-v1'),
    );
    return Uint8List.fromList(
      utf8.encode(
        jsonEncode({
          'format': 'imun-backup',
          'version': 1,
          'kdf': 'pbkdf2-sha256',
          'iterations': iterations,
          'salt': base64Encode(salt),
          'data': base64Encode(box.concatenation()),
        }),
      ),
    );
  }

  Future<Map<String, Object?>> decrypt(Uint8List bytes, String password) async {
    if (bytes.length > maxBytes) throw FormatException('Backup too large');
    final envelope = jsonDecode(utf8.decode(bytes));
    if (envelope is! Map ||
        envelope['format'] != 'imun-backup' ||
        envelope['version'] != 1 ||
        envelope['kdf'] != 'pbkdf2-sha256' ||
        envelope['iterations'] != iterations) {
      throw FormatException('Unsupported backup');
    }
    final salt = base64Decode(envelope['salt'] as String);
    final data = base64Decode(envelope['data'] as String);
    if (salt.length != 16 || data.length < 28)
      throw FormatException('Invalid backup');
    final box = SecretBox.fromConcatenation(
      data,
      nonceLength: 12,
      macLength: 16,
    );
    final plain = await AesGcm.with256bits().decrypt(
      box,
      secretKey: await _key(password, salt),
      aad: utf8.encode('imun-backup-v1'),
    );
    final decoded = jsonDecode(utf8.decode(plain));
    _validate(decoded);
    return Map<String, Object?>.from(decoded as Map);
  }

  void _validate(Object? data) {
    if (data is! Map || data['sembast_export'] != 1 || data['version'] != 1)
      throw FormatException('Invalid database');
    final stores = data['stores'];
    if (stores == null) return;
    if (stores is! List) throw FormatException('Invalid stores');
    final seen = <String>{};
    for (final item in stores) {
      if (item is! Map ||
          item['name'] is! String ||
          !_stores.contains(item['name']) ||
          !seen.add(item['name'] as String) ||
          item['keys'] is! List ||
          item['values'] is! List)
        throw FormatException('Invalid store');
      final keys = item['keys'] as List;
      final values = item['values'] as List;
      if (keys.length != values.length ||
          keys.any((key) => key is! int || key < 1) ||
          keys.toSet().length != keys.length ||
          values.any((value) => value is! Map))
        throw FormatException('Invalid records');
    }
  }

  /// Replaces the known stores in one database transaction. A failure rolls
  /// back all changes. Call only after decrypting and explicit user consent.
  Future<void> restore(Database db, Map<String, Object?> data) async {
    _validate(data);
    final stores = (data['stores'] as List?) ?? [];
    await db.transaction((txn) async {
      for (final name in _stores) {
        await intMapStoreFactory.store(name).delete(txn);
      }
      for (final entry in stores) {
        final store = intMapStoreFactory.store(entry['name'] as String);
        final keys = entry['keys'] as List;
        final values = entry['values'] as List;
        for (var i = 0; i < keys.length; i++) {
          await store
              .record(keys[i] as int)
              .put(txn, Map<String, Object?>.from(values[i] as Map));
        }
      }
    });
  }
}

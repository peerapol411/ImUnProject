import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_mom/database/im_un_database.dart';
import 'package:project_mom/database/portable_backup.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({super.key});
  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  bool busy = false;
  final backup = PortableBackup();

  Future<String?> password({required bool creating}) async {
    final first = TextEditingController();
    final second = TextEditingController();
    String? error;
    final result = await showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, update) => AlertDialog(
          title: Text(creating ? 'ตั้งรหัสผ่านไฟล์สำรอง' : 'รหัสผ่านไฟล์สำรอง'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  creating
                      ? 'ใช้รหัสผ่านอย่างน้อย 12 ตัวอักษร เก็บรหัสผ่านและไฟล์ไว้แยกกัน หากลืมรหัสผ่านจะกู้ข้อมูลไม่ได้'
                      : 'กรอกรหัสผ่านที่ใช้สร้างไฟล์สำรอง',
                ),
                TextField(
                  controller: first,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: 'รหัสผ่าน'),
                ),
                if (creating)
                  TextField(
                    controller: second,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'ยืนยันรหัสผ่าน',
                    ),
                  ),
                if (error != null)
                  Text(error!, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                if (first.text.isEmpty ||
                    (creating &&
                        (first.text.length < 12 ||
                            first.text != second.text))) {
                  update(
                    () =>
                        error = 'รหัสผ่านต้องมีอย่างน้อย 12 ตัวอักษรและตรงกัน',
                  );
                  return;
                }
                Navigator.pop(context, first.text);
              },
              child: const Text('ตกลง'),
            ),
          ],
        ),
      ),
    );
    // Controllers are disposed after the dialog's exit animation.
    Future<void>.delayed(const Duration(seconds: 1), () {
      first.dispose();
      second.dispose();
    });
    return result;
  }

  Future<void> makeBackup() async {
    final pass = await password(creating: true);
    if (pass == null || !mounted) return;
    setState(() => busy = true);
    try {
      final db = await ImUnDB(dbName: 'ImUnTransaction.db').openDatabase();
      final bytes = await backup.create(db, pass);
      final saved = await FilePicker.saveFile(
        fileName: 'imun-backup.imun',
        bytes: bytes,
        dialogTitle: 'บันทึกไฟล์สำรอง',
      );
      if (mounted && saved != null)
        _message('บันทึกไฟล์สำรองแล้ว โปรดเก็บรหัสผ่านแยกจากไฟล์');
    } catch (_) {
      if (mounted) _message('ไม่สามารถสร้างไฟล์สำรองได้ โปรดลองอีกครั้ง');
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> restoreBackup() async {
    try {
      final files = await FilePicker.pickFiles(
        dialogTitle: 'เลือกไฟล์สำรองอิ่มอุ่น',
      );
      if (files.isEmpty || !mounted) return;
      final filePath = files.first.path;
      if (filePath == null) throw const FormatException('File unavailable');
      final file = File(filePath);
      if (await file.length() > PortableBackup.maxBytes)
        throw const FormatException('File too large');
      final bytes = await file.readAsBytes();
      if (!mounted) return;
      final pass = await password(creating: false);
      if (pass == null || !mounted) return;
      setState(() => busy = true);
      final data = await backup.decrypt(bytes, pass);
      if (!mounted) return;
      setState(() => busy = false);
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('แทนที่ข้อมูลในเครื่อง?'),
          content: const Text(
            'การกู้คืนจะแทนที่ประวัติทั้งหมดในเครื่องนี้ด้วยข้อมูลจากไฟล์ หากต้องการเก็บข้อมูลปัจจุบัน โปรดสำรองข้อมูลก่อน',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('กู้คืนและแทนที่'),
            ),
          ],
        ),
      );
      if (confirmed != true || !mounted) return;
      setState(() => busy = true);
      final db = await ImUnDB(dbName: 'ImUnTransaction.db').openDatabase();
      await backup.restore(db, data);
      if (mounted) _message('กู้คืนข้อมูลสำเร็จ');
    } catch (_) {
      if (mounted)
        _message(
          'กู้คืนไม่สำเร็จ รหัสผ่านอาจไม่ถูกต้องหรือไฟล์เสีย ข้อมูลปัจจุบันยังอยู่',
        );
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  void _message(String message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message)));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('สำรองและกู้คืนข้อมูล')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'สร้างไฟล์สำรองที่เข้ารหัส แล้วเก็บไฟล์ไว้ในที่ปลอดภัยนอกเครื่องนี้ เช่น พื้นที่จัดเก็บส่วนตัว แอปไม่เก็บรหัสผ่านให้คุณ',
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: busy ? null : makeBackup,
            child: const Text('สร้างไฟล์สำรอง'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: busy ? null : restoreBackup,
            child: const Text('กู้คืนจากไฟล์สำรอง'),
          ),
          if (busy)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    ),
  );
}

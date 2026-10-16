import 'package:flutter/material.dart';

// Halaman tab "Pengaturan" (contoh tampilan sederhana).
class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(leading: Icon(Icons.notifications), title: Text('Notifikasi')),
        ListTile(leading: Icon(Icons.language), title: Text('Bahasa')),
        ListTile(leading: Icon(Icons.lock), title: Text('Privasi')),
      ],
    );
  }
}

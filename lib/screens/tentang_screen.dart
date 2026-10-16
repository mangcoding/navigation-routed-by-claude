import 'package:flutter/material.dart';

import '../main.dart';

// Halaman TENTANG: dibuka dari menu Drawer memakai named route.
class TentangScreen extends StatelessWidget {
  const TentangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aplikasi contoh materi Navigasi & Drawer\n'
              'Pemrograman Perangkat Mobile - Universitas Nusa Putra',
            ),
            const SizedBox(height: 24),

            // popUntil: kembali terus sampai ke halaman pertama (home).
            // Berguna jika sudah membuka banyak halaman bertumpuk.
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(AppRoutes.home));
              },
              child: const Text('Kembali ke Home'),
            ),
          ],
        ),
      ),
    );
  }
}

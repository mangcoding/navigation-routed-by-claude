import 'package:flutter/material.dart';

// Halaman DETAIL: halaman baru yang "ditumpuk" di atas MainScreen.
// Bisa dibuka dengan 2 cara (lihat beranda_page.dart):
//   1. Navigator.pushNamed(..., arguments: ...) -> data dari route arguments
//   2. Navigator.push(MaterialPageRoute(...))   -> data dari constructor
class DetailScreen extends StatelessWidget {
  // Diisi jika dibuka memakai Navigator.push (cara 2).
  final String? judulLangsung;

  const DetailScreen({super.key, this.judulLangsung});

  @override
  Widget build(BuildContext context) {
    // Ambil data yang dikirim lewat `arguments` (cara 1).
    final argumen = ModalRoute.of(context)?.settings.arguments as String?;

    // Pakai data dari constructor dulu, kalau kosong pakai arguments.
    final judul = judulLangsung ?? argumen ?? 'Tanpa Judul';

    return Scaffold(
      // AppBar otomatis menampilkan tombol kembali (←)
      // karena halaman ini ada di atas halaman lain.
      appBar: AppBar(title: const Text('Detail')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(judul, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 24),

            // Kembali ke halaman sebelumnya TANPA mengirim data.
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
            const SizedBox(height: 8),

            // Kembali ke halaman sebelumnya SAMBIL mengirim data.
            FilledButton(
              onPressed: () => Navigator.pop(context, 'Sudah membaca $judul'),
              child: const Text('Kembali + Kirim Data'),
            ),
          ],
        ),
      ),
    );
  }
}

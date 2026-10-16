import 'package:flutter/material.dart';

import '../main.dart';
import 'detail_screen.dart';

// Halaman tab "Beranda".
// Berisi contoh 2 CARA berpindah ke halaman lain.
class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  // Data contoh untuk ditampilkan dalam list.
  final List<String> _matkul = const [
    'Pemrograman Mobile',
    'Basis Data',
    'Rekayasa Perangkat Lunak',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Klik salah satu mata kuliah:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // ----------------------------------------------------------
        // CARA 1: Navigator.pushNamed() + arguments (memakai routing)
        // ----------------------------------------------------------
        for (final nama in _matkul)
          Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(nama),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                // Kirim data ke halaman detail lewat `arguments`.
                // `await` menunggu sampai halaman detail ditutup,
                // lalu menerima nilai yang dikirim balik oleh Navigator.pop().
                final hasil = await Navigator.pushNamed(
                  context,
                  AppRoutes.detail,
                  arguments: nama,
                );

                // Tampilkan pesan jika ada data yang dikirim balik.
                if (hasil != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pesan dari detail: $hasil')),
                  );
                }
              },
            ),
          ),

        const SizedBox(height: 24),

        // ----------------------------------------------------------
        // CARA 2: Navigator.push() + MaterialPageRoute (tanpa nama route)
        // ----------------------------------------------------------
        ElevatedButton.icon(
          icon: const Icon(Icons.open_in_new),
          label: const Text('Buka Detail (Navigator.push)'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // Data dikirim langsung lewat constructor.
                builder: (context) =>
                    const DetailScreen(judulLangsung: 'Dibuka via push()'),
              ),
            );
          },
        ),
      ],
    );
  }
}

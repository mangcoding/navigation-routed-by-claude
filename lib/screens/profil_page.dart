import 'package:flutter/material.dart';

// Halaman tab "Profil" (contoh tampilan sederhana).
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 16),
          Text('Mahasiswa Nusa Putra', style: TextStyle(fontSize: 20)),
          Text('Teknik Informatika'),
        ],
      ),
    );
  }
}

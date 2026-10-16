import 'package:flutter/material.dart';

import '../main.dart';

// DRAWER = menu yang muncul dari sisi kiri layar.
// Dibuka dengan ikon "hamburger" (☰) di AppBar atau dengan swipe dari kiri.
// Ikon hamburger muncul OTOMATIS jika Scaffold memiliki properti `drawer`.
class AppDrawer extends StatelessWidget {
  // Callback untuk memberi tahu MainScreen tab mana yang dipilih.
  final ValueChanged<int> onPilihMenu;

  const AppDrawer({super.key, required this.onPilihMenu});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Bagian header drawer (biasanya berisi info user).
          const UserAccountsDrawerHeader(
            accountName: Text('Mahasiswa Nusa Putra'),
            accountEmail: Text('mahasiswa@nusaputra.ac.id'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
          ),

          // Menu yang sama dengan Bottom Navigation (mengganti tab).
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.pop(context); // 1. Tutup drawer dulu
              onPilihMenu(0); //          2. Pindah ke tab Beranda
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () {
              Navigator.pop(context);
              onPilihMenu(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              onPilihMenu(2);
            },
          ),

          const Divider(),

          // Menu yang membuka HALAMAN BARU memakai named route.
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Aplikasi'),
            onTap: () {
              Navigator.pop(context); // Tutup drawer
              Navigator.pushNamed(context, AppRoutes.tentang); // Buka halaman
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'beranda_page.dart';
import 'pengaturan_page.dart';
import 'profil_page.dart';

// MainScreen = "kerangka" aplikasi yang berisi:
// AppBar + Drawer + Body (berganti sesuai tab) + BottomNavigationBar.
//
// Memakai StatefulWidget karena tab yang aktif (_indexAktif) bisa berubah.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Menyimpan posisi tab yang sedang aktif (0 = Beranda).
  int _indexAktif = 0;

  // Daftar halaman untuk setiap tab. Urutannya harus sama
  // dengan urutan item di BottomNavigationBar.
  final List<Widget> _halaman = const [
    BerandaPage(),
    ProfilPage(),
    PengaturanPage(),
  ];

  // Judul AppBar untuk setiap tab.
  final List<String> _judul = const ['Beranda', 'Profil', 'Pengaturan'];

  // Dipanggil saat tab diklik (dari bottom nav atau dari drawer).
  void _gantiTab(int index) {
    // setState() memberi tahu Flutter untuk menggambar ulang tampilan.
    setState(() {
      _indexAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_judul[_indexAktif]),
      ),

      // Memasang Drawer -> ikon ☰ otomatis muncul di AppBar.
      drawer: AppDrawer(onPilihMenu: _gantiTab),

      // Tampilkan halaman sesuai tab yang aktif.
      body: _halaman[_indexAktif],

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAktif, // tab yang sedang disorot
        onTap: _gantiTab, //          aksi saat tab diklik
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}

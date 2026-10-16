// =====================================================================
// CONTOH APLIKASI: NAVIGASI, ROUTING, DRAWER & BOTTOM NAVIGATION
// =====================================================================
// Materi yang dicontohkan:
// 1. Named Routes (routing)         -> lihat bagian `routes` di bawah
// 2. Perpindahan antar screen       -> Navigator.push / pushNamed / pop
// 3. Drawer (menu samping)          -> lib/widgets/app_drawer.dart
// 4. Bottom Navigation Bar          -> lib/screens/main_screen.dart
// =====================================================================

import 'package:flutter/material.dart';

import 'screens/detail_screen.dart';
import 'screens/main_screen.dart';
import 'screens/tentang_screen.dart';

void main() {
  runApp(const MyApp());
}

// Kumpulan nama route disimpan sebagai konstanta,
// supaya tidak salah ketik saat memanggil Navigator.pushNamed().
class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
  static const String tentang = '/tentang';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi & Drawer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),

      // Halaman pertama yang dibuka saat aplikasi dijalankan.
      initialRoute: AppRoutes.home,

      // ROUTING: daftar "alamat" halaman dan widget yang ditampilkan.
      // Cara memanggil: Navigator.pushNamed(context, AppRoutes.tentang);
      routes: {
        AppRoutes.home: (context) => const MainScreen(),
        AppRoutes.detail: (context) => const DetailScreen(),
        AppRoutes.tentang: (context) => const TentangScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Untuk navigasi

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; // Menyimpan tab aktif

  // List halaman untuk setiap tab
  final List<Widget> _pages = [
    const Center(child: Text("Home", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Calendar", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Profile", style: TextStyle(fontSize: 24))),
  ];

  // Fungsi untuk logout
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
              Get.offAllNamed('/login'); // Kembali ke login
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context); // Dialog logout
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Tampilkan halaman berdasarkan tab aktif
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0; // Pindah ke tab Home
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1; // Pindah ke tab Calendar
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2; // Pindah ke tab Profile
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

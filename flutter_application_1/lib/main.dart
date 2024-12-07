import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/dashboard.dart'; // Import Dashboard

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Aplikasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Rute awal
      getPages: [
        GetPage(name: '/', page: () => const Login()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
      ],
    );
  }
}

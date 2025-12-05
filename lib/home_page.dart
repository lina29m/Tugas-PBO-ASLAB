import 'package:flutter/material.dart';
import 'package:praktikum11/login_page.dart';
import 'package:praktikum11/session_manager.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) async {
    await SessionManager.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: const Center(
        child: Text("Selamat datang!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
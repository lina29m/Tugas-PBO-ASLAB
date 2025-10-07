import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/857/857681.png",
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              "Selamat datang di Aplikasi Kontak 5C!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Gunakan menu di bawah untuk melihat daftar kontak atau menambah data baru.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

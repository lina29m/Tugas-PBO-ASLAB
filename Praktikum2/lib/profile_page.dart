import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Aplikasi: Roma App", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Versi: 1.0.0", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Developer: Roma Ulina", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputMahasiswaPage extends StatefulWidget {
  const InputMahasiswaPage({super.key});

  @override
  State<InputMahasiswaPage> createState() => _InputMahasiswaPageState();
}

class _InputMahasiswaPageState extends State<InputMahasiswaPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kontakController = TextEditingController();

  void simpanData() {
    if (namaController.text.isEmpty ||
        umurController.text.isEmpty ||
        alamatController.text.isEmpty ||
        kontakController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua field harus diisi")),
      );
      return;
    }

    final mahasiswa = {
      "nama": namaController.text,
      "umur": umurController.text,
      "alamat": alamatController.text,
      "kontak": kontakController.text,
    };

    Navigator.pop(context, mahasiswa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: namaController, decoration: const InputDecoration(labelText: "Nama")),
            TextField(controller: umurController, decoration: const InputDecoration(labelText: "Umur")),
            TextField(controller: alamatController, decoration: const InputDecoration(labelText: "Alamat")),
            TextField(controller: kontakController, decoration: const InputDecoration(labelText: "Kontak")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: simpanData,
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}

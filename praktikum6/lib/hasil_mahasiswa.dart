import 'package:flutter/material.dart';

class HasilMahasiswa extends StatelessWidget {
  final String nama;
  final String email;
  final String hp;
  final String jenisKelamin;

  const HasilMahasiswa({
    super.key,
    required this.nama,
    required this.email,
    required this.hp,
    required this.jenisKelamin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Data Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: $nama', style: const TextStyle(fontSize: 18)),
                Text('Email: $email', style: const TextStyle(fontSize: 18)),
                Text('Nomor HP: $hp', style: const TextStyle(fontSize: 18)),
                Text('Jenis Kelamin: $jenisKelamin',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali ke Form'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

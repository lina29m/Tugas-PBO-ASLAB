import 'package:flutter/material.dart';
import 'list_mahasiswa.dart';

class FormMahasiswa extends StatefulWidget {
  const FormMahasiswa({super.key});

  @override
  State<FormMahasiswa> createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  String? _jenisKelamin;

  // list untuk menyimpan data sementara
  static final List<Map<String, String>> _dataMahasiswa = [];

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _dataMahasiswa.add({
          'nama': _namaController.text,
          'email': _emailController.text,
          'hp': _hpController.text,
          'jenisKelamin': _jenisKelamin!,
        });
      });

      // kosongkan form
      _namaController.clear();
      _emailController.clear();
      _hpController.clear();
      _jenisKelamin = null;

      // pindah ke halaman list
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListMahasiswa(data: _dataMahasiswa),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Data Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email (@unsika.ac.id)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email wajib diisi';
                  } else if (!value.endsWith('@unsika.ac.id')) {
                    return 'Gunakan domain @unsika.ac.id';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hpController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor HP wajib diisi';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Nomor HP hanya angka';
                  } else if (value.length < 10) {
                    return 'Minimal 10 digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                  DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
                ],
                value: _jenisKelamin,
                onChanged: (value) => setState(() {
                  _jenisKelamin = value;
                }),
                validator: (value) =>
                    value == null ? 'Pilih jenis kelamin' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
                onPressed: _simpanData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

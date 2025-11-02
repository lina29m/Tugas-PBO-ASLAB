import 'package:flutter/material.dart';
import 'list_mahasiswa.dart';

class FormMahasiswa extends StatefulWidget {
  final Map<String, String>? dataMahasiswa;
  final int? index;
  final List<Map<String, String>>? listData;

  const FormMahasiswa({super.key})
      : dataMahasiswa = null,
        index = null,
        listData = null;

  const FormMahasiswa.edit({
    super.key,
    required this.dataMahasiswa,
    required this.index,
    required this.listData,
  });

  @override
  State<FormMahasiswa> createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  String? _jenisKelamin;

  static final List<Map<String, String>> _dataMahasiswa = [];

  @override
  void initState() {
    super.initState();
    if (widget.dataMahasiswa != null) {
      // mode edit: isi data lama
      _namaController.text = widget.dataMahasiswa!['nama']!;
      _emailController.text = widget.dataMahasiswa!['email']!;
      _hpController.text = widget.dataMahasiswa!['hp']!;
      _jenisKelamin = widget.dataMahasiswa!['jenisKelamin'];
    }
  }

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        final newData = {
          'nama': _namaController.text,
          'email': _emailController.text,
          'hp': _hpController.text,
          'jenisKelamin': _jenisKelamin!,
        };

        if (widget.dataMahasiswa != null &&
            widget.index != null &&
            widget.listData != null) {
          // mode edit
          widget.listData![widget.index!] = newData;
          Navigator.pop(context, true);
        } else {
          // mode tambah
          _dataMahasiswa.add(newData);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListMahasiswa(data: _dataMahasiswa),
            ),
          );
        }
      });

      // kosongkan form setelah tambah data
      _namaController.clear();
      _emailController.clear();
      _hpController.clear();
      _jenisKelamin = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.dataMahasiswa != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Data Mahasiswa' : 'Form Data Mahasiswa'),
      ),
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
                icon: Icon(isEdit ? Icons.save_as : Icons.save),
                label: Text(isEdit ? 'Simpan Perubahan' : 'Simpan'),
                onPressed: _simpanData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

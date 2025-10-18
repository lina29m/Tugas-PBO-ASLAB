import 'package:flutter/material.dart';

class ListMahasiswa extends StatelessWidget {
  final List<Map<String, String>> data;

  const ListMahasiswa({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Data',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: data.isEmpty
            ? const Center(child: Text('Belum ada data mahasiswa.'))
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final mhs = data[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          mhs['nama']![0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(mhs['nama'] ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(mhs['email'] ?? ''),
                          Text('HP: ${mhs['hp']}'),
                          Text('Jenis Kelamin: ${mhs['jenisKelamin']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

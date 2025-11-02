import 'package:flutter/material.dart';
import 'form_mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  final List<Map<String, String>> data;

  const ListMahasiswa({super.key, required this.data});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  void _editMahasiswa(int index) async {
    final selected = widget.data[index];

    // Navigasi ke form dengan data yang akan diedit
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormMahasiswa.edit(
          dataMahasiswa: selected,
          index: index,
          listData: widget.data,
        ),
      ),
    );

    // Update tampilan setelah kembali dari form
    if (updatedData != null) {
      setState(() {});
    }
  }

  void _hapusMahasiswa(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text(
            'Apakah kamu yakin ingin menghapus data ${widget.data[index]['nama']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.data.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

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
        child: widget.data.isEmpty
            ? const Center(child: Text('Belum ada data mahasiswa.'))
            : ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  final mhs = widget.data[index];
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editMahasiswa(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _hapusMahasiswa(index),
                          ),
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

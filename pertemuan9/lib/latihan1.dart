// latihan1.dart
import 'package:flutter/material.dart';
import 'hewan.dart';

class Kucing extends Hewan {
  String warnaBulu;

  Kucing(String nama, double berat, this.warnaBulu) : super(nama, berat);

  @override
  void makan(double porsi) {
    // override: hanya menampilkan kalimat, tidak menambah berat
    print("Kucing $nama sedang makan sebanyak $porsi gram.");
    berat += porsi; // tetap naik agar tidak error
  }
}

class Latihan1 extends StatelessWidget {
  Latihan1({super.key});

  final List<Kucing> daftarKucing = [
    Kucing("Farras", 3.5, "Putih"),
    Kucing("Kolag", 4.2, "Oranye"),
    Kucing("Hijau", 5.0, "Hitam"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Latihan 1: Kucing")),
      body: ListView.builder(
        itemCount: daftarKucing.length,
        itemBuilder: (context, index) {
          final k = daftarKucing[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(k.nama),
              subtitle: Text(
                  "Berat: ${k.berat} kg | Warna bulu: ${k.warnaBulu}"),
            ),
          );
        },
      ),
    );
  }
}

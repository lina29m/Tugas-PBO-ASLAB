// latihan2.dart
import 'package:flutter/material.dart';
import 'hewan.dart';

class Latihan2 extends StatefulWidget {
  const Latihan2({super.key});

  @override
  State<Latihan2> createState() => _Latihan2State();
}

class _Latihan2State extends State<Latihan2> {
  final hewan = Hewan("Kucing", 4.0);

  void tambahBerat() {
    setState(() {
      hewan.makan(1.0); // tambah 1 kg
    });
  }

  void kurangiBerat() {
    setState(() {
      hewan.lari(0.5); // kurangi 0.5 kg
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Latihan 2: Makan & Lari")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Berat ${hewan.nama}: ${hewan.berat.toStringAsFixed(1)} kg",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: tambahBerat,
              child: const Text("Makan (+1 kg)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: kurangiBerat,
              child: const Text("Lari (-0.5 kg)"),
            ),
          ],
        ),
      ),
    );
  }
}

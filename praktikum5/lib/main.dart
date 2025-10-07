import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Berita',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const BeritaPage(),
    );
  }
}

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  final List<Map<String, String>> beritaList = const [
    {
      'judul': 'Perkembangan Teknologi di Era Digital',
      'deskripsi':
          'Inovasi teknologi semakin pesat, mulai dari kecerdasan buatan hingga otomatisasi industri yang mengubah cara hidup manusia.',
      'gambar':
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/news-lower-thirds-logo-design-template-fd8c289805869d8bf55fa361f76b8bea_screen.jpg?ts=1606075097'
    },
    {
      'judul': 'Tren Game Mobile (MBG) Terbaru 2025',
      'deskripsi':
          'Mobile-based games (MBG) kini mendominasi industri hiburan digital dengan jutaan pemain aktif setiap harinya di berbagai platform.',
      'gambar':
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/news-lower-thirds-logo-design-template-fd8c289805869d8bf55fa361f76b8bea_screen.jpg?ts=1606075097'
    },
    {
      'judul': 'Pentingnya Keamanan Siber',
      'deskripsi':
          'Dengan meningkatnya aktivitas online, kesadaran terhadap keamanan siber menjadi hal yang wajib diperhatikan oleh semua pengguna.',
      'gambar':
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/news-lower-thirds-logo-design-template-fd8c289805869d8bf55fa361f76b8bea_screen.jpg?ts=1606075097'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Berita / Artikel'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return ListTile(
            leading: Image.network(
              berita['gambar']!,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image);
              },
            ),
            title: Text(
              berita['judul']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(berita['deskripsi']!),
            trailing: const Icon(Icons.bookmark_border),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Mengalihkan ke halaman berita"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

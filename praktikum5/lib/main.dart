import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(BelajarImage());

class BelajarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Belajar menampilkan gambar')),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/images/gambar.jpg', height: 100, width: 100),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJwM-UwQ36lOLL9xxHtojQOB5Yp3SVWmYV0w&s',
              ),
              CachedNetworkImage(
                imageUrl:
                    "https://cdn.pixabay.com/photo/2019/11/10/17/36/indonesia-4616370_1280.jpg",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Text("Koneksi Error"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int count = 0;

  void increment() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.home, color: Colors.white),
            SizedBox(width: 8),
            Text('Aplikasi Mahasiswa'),
          ],
        ),
      ),
      drawer: Drawer( 
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu Utama',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Data Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Count: $count',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}






//class MyApp extends StatelessWidget {
  //const MyApp({super.key});

 //@override
//Widget build(BuildContext context) {
  //return Scaffold(
    //appBar: AppBar(
      //title: const Text('Aplikasi Mahasiswa'),
    //),
    //body: const Center(
      //child: Text(
        //'Selamat datang di aplikasi mahasiswa',
        //style: TextStyle(
          //fontSize: 24,
          //fontWeight: FontWeight.bold,
        //),
      //),
    //),
  //);
//}
//}

//class MyApp extends StatelessWidget {
//  const MyApp({super.key});

 // @override//
//  Widget build(BuildContext context) {
   // return const Text(
  //  'Hello , Flutter',
  //  style: TextStyle(fontSize: 24, fontWeigth: Fontweight.bold));
//  }

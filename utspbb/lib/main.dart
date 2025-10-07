import 'package:flutter/material.dart';
import 'storage.dart';
import 'contact.dart';
import 'add_contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Kontak',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    final data = await Storage.loadContacts();
    setState(() {
      contacts = data;
    });
  }

  void addContact(Contact contact) async {
    setState(() {
      contacts.add(contact);
    });
    await Storage.saveContacts(contacts);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kontak berhasil disimpan!')),
    );
  }

  void deleteContact(int index) async {
    setState(() {
      contacts.removeAt(index);
    });
    await Storage.saveContacts(contacts);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kontak dihapus!')),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ContactListPage(contacts: contacts, onDelete: deleteContact),
      AddContactPage(onAdd: addContact),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Kontak')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Daftar'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Tambah'),
        ],
      ),
    );
  }
}

class ContactListPage extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;

  ContactListPage({required this.contacts, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? Center(child: Text('Belum ada kontak tersimpan'))
        : ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final c = contacts[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(c.name[0].toUpperCase(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  title: Text(c.name),
                  subtitle: Text(c.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDelete(index),
                  ),
                ),
              );
            },
          );
  }
}

class AddContactPage extends StatefulWidget {
  final Function(Contact) onAdd;

  AddContactPage({required this.onAdd});

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  void _save() {
    if (_formKey.currentState!.validate()) {
      final newContact =
          Contact(name: _nameCtrl.text.trim(), email: _emailCtrl.text.trim());
      widget.onAdd(newContact);
      _nameCtrl.clear();
      _emailCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1250/1250689.png',
              height: 120,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nama wajib diisi' : null,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email wajib diisi';
                } else if (!value.contains('@')) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _save,
              icon: Icon(Icons.save),
              label: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

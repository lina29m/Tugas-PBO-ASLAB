import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'contact.dart';

class Storage {
  static const String key = 'contacts';

  static Future<List<Contact>> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => Contact.fromMap(e)).toList();
  }

  static Future<void> saveContacts(List<Contact> contacts) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(contacts.map((c) => c.toMap()).toList());
    await prefs.setString(key, jsonString);
  }
}

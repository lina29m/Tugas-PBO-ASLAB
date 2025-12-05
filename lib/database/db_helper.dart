import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:praktikum11/model/user.dart';

class DBHelper {

  // =======================
  // ========== WEB =======
  // =======================
  Future<bool> _registerWeb(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', user.username);
    await prefs.setString('password', user.password);
    return true;
  }

  Future<User?> _loginWeb(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final u = prefs.getString('username');
    final p = prefs.getString('password');

    if (u == username && p == password) {
      return User(username: u!, password: p!);
    }
    return null;
  }

  // ==========================
  // ==== MOBILE & DESKTOP ====
  // ==========================
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('auth_user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  }

  // =====================
  // ==== UNIFIED API ====
  // =====================
  Future<dynamic> registerUser(User user) async {
    if (kIsWeb) {
      return await _registerWeb(user); // return bool
    }

    final db = await instance.database;
    return await db.insert('users', user.toMap()); // return int
  }

  Future<User?> login(String username, String password) async {
    if (kIsWeb) {
      return await _loginWeb(username, password);
    }

    final db = await instance.database;

    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }

    return null;
  }
}

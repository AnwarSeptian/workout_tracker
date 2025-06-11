import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_tracker/database/preference.dart';
import 'package:workout_tracker/model/user_model.dart';

class DbUser {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      version: 1,
      join(dbPath, 'users.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  static Future<void> registerUser({UserModel? data}) async {
    final db = await initDB();
    await db.insert('users', {
      'name': data?.name,
      'email': data?.email,
      'password': data?.password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    print("User registered successfully");
  }

  static Future<UserModel?> login(String email, String password) async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query(
      'users',
      where: 'email =? AND password = ?',
      whereArgs: [email, password],
    );
    print(data);
    if (data.isNotEmpty) {
      PreferenceHandler;
      return UserModel.fromMap(data.first);
    } else {
      return null;
    }
  }
}

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_tracker/model/latihan_model.dart';

class DbLatihan {
  static Future<Database> dbLatihan() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'latihan.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE latihan (id INTEGER PRIMARY KEY AUTOINCREMENT,namalatihan TEXT,tanggal TEXT,total INTEGER, durasi INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertLatihan(LatihanModel latihanmodel) async {
    final db = await DbLatihan.dbLatihan();
    await db.insert(
      'latihan',
      latihanmodel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('{$latihanmodel.toMap()}');
  }

  static Future<List<LatihanModel>> getLatihanModel() async {
    final db = await DbLatihan.dbLatihan();
    final List<Map<String, dynamic>> maps = await db.query('latihan');
    print('data dari DB: $maps');

    return List.generate(maps.length, (i) => LatihanModel.fromMap(maps[i]));
  }

  static Future<void> updateData(LatihanModel latihanmodel) async {
    final db = await DbLatihan.dbLatihan();
    await db.update(
      'latihan',
      latihanmodel.toMap(),
      where: 'id = ?',
      whereArgs: [latihanmodel.id],
    );
  }

  static Future<void> deleteData(int id) async {
    final db = await DbLatihan.dbLatihan();
    await db.delete('latihan', where: 'id = ?', whereArgs: [id]);
  }
}

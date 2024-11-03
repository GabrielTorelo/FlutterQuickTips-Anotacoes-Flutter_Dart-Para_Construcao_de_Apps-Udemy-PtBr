import 'package:projeto_my_places/constants/sqlite_queries.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;

class DbSqlite {
  static Future<sqlite.Database> open() async {
    final dbPath = await sqlite.getDatabasesPath();

    return sqlite.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          SqliteQueries.createDatabase,
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbSqlite.open();

    db.insert(
      table,
      data,
      conflictAlgorithm: sqlite.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> select(String table) async {
    final db = await DbSqlite.open();

    return await db.query(table);
  }

  static Future<void> delete(String table, String id) async {
    final db = await DbSqlite.open();

    db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

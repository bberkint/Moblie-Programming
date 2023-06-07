import 'package:sqflite/sqflite.dart';

class SQLHelper {
  //Tablo oluşturan fonksiyon

  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE books
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      desc TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    """);
  }

  static Future<Database> db() async {
    return openDatabase(
      "kbu_library.db",
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SQLHelper.db();
    return db.query("books", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int bookId) async {
    final db = await SQLHelper.db();

    return db.query("books", where: 'id = ?', whereArgs: [bookId], limit: 2);
  }

  static Future<int> createBook(String title, String? desc) async {
    final db = await SQLHelper.db();
    final data = {"title": title, "desc": desc};
    final id = await db.insert(
      "books",
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> updateBook(int id, String title, String? desc) async {
    final db = await SQLHelper.db();
    final data = {"title": title, "desc": desc};
    final result =
        await db.update("books", data, where: "id =?", whereArgs: [id]);

    return result;
  }

  static Future<void> deleteBook(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("books", where: "id = ?", whereArgs: [id]);
    } catch (err) {}
  }
}

import 'package:sqflite/sqflite.dart'; //sqflite untuk database
import 'package:path/path.dart'; //package path
import './todo_model.dart'; //model todo yang kita buat sebelumnya

class DatabaseConnect {
  Database? _database;

  //membuat getter dan membuka koneksi ke database
  Future<Database> get database async {
    //ini adalah lokasi database dalam device kita. misal: data/data/...
    final dbpath = await getDatabasesPath();
    //ini adalah nama database
    const dbname = 'todo.db';
    //ini menggabungkan dbpath dan dbname untuk membuat full path dari database
    //misal: data/data/todo.db
    final path = join(dbpath, dbname);

    //buka koneksi
    _database = await openDatabase(path, version: 1, onCreate: _createDb);
    //kita akan membuat function _createDB terpisah

    return _database!;
  }

  //function _createDb
  //digunakan untuk membuat table di database
  Future<void> _createDb(Database db, int version) async {
    //pastikan kolom yang kita buat sesuai dengan field model di todo_model
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        createdAt TEXT,
        isChecked INTEGER
      )
    ''');
  }

  //function untuk menambah data (insert) kedalam database
  Future<void> insertTodo(Todo todo) async {
    //koneksi ke db
    final db = await database;
    //insert todo
    await db.insert(
      'todo', //nama table
      todo.toMap(), //function yang dibuat dalam todo_model
      conflictAlgorithm:
          ConflictAlgorithm.replace, //akan mereplace duplicate entry
    );
  }

  //function untuk menghapus data (delete) dari database
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    //delete todo dari database berdasarkan id
    db.delete(
      'todo',
      where: 'id == ?', //ini akan mengecek id
      whereArgs: [todo.id],
    );
  }
}

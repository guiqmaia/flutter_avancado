import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Singleton

  DatabaseHelper._();

  static DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDataBase();
    return _database!;
  }

  Future<Database> _initDataBase() async {
    String path = await getDatabasesPath();
    String pathWithName = '$path/database.db';
    return await openDatabase(
      pathWithName,
      version: 1,
      onCreate: onCreateTable,
    );
  }

  //Method to create table in onCreate at openDatabase
  Future onCreateTable(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS Texts (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT) ',
    );
  }

  //CRUD Methods

  Future<int> insertText(String text) async {
    Database db = await instance.database;

    return db.insert('Texts', {'title': text});
  }

  Future<String> getText() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> response = await db.query('Texts');
    if (response.isNotEmpty) {
      return response.last['title'];
    } else {
      return 'Não encontrado';
    }
  }
}

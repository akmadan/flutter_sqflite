import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final dbName = 'mydatabase.db';
  static final dbVersion = 1;
  static final _tablename = 'mytable';
  static final colId = 'id';
  static final colName = 'name';

  //making a Singleton Class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initiatedatabase();
    return _database;
  }

  initiatedatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    await openDatabase(path, version: dbVersion, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version) async {
    db.query(''' 
                CREATE TABLE $_tablename ($colId INTEGER PRIMARY KEY , $colName TEXT NOT NULL)
       ''');
  }

  Future<int> insertFunction(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(_tablename, row);
  }

  Future<List<Map<String, dynamic>>> queryAllFunction() async {
    Database? db = await instance.database;
    return await db!.query(_tablename);
  }

  Future<int> updateFunction(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[colId];
    return await db!
        .update(_tablename, row, where: '$colId = ?', whereArgs: [id]);
  }

  Future<int> deleteDunction(int id) async {
    Database? db = await instance.database;
    return await db!.delete(_tablename, where: '$colId = ?', whereArgs: [id]);
  }
}

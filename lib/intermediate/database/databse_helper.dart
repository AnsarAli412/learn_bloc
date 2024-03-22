import 'package:learn_bloc_flutter/sqflite/models/students_model.dart';
import 'package:sqflite/sqflite.dart';

mixin class DatabaseHelper {
  final _dbName = "students.db";
  final TABLENAME = 'students';
  final VERSION = 1;

  Database? database;

  Future<Database?> _getDatabase() async {
    if (database != null) return database;
    return await _initDatabase();
  }

  Future<String> _createDatabase() async {
    var name = getDatabasesPath();
    return "$name/$_dbName";
  }

  Future<Database> _initDatabase() async {
    var dbName = await _createDatabase();
    return await openDatabase(dbName, version: VERSION, onCreate: _createTable);
  }

  _createTable(Database db, int version) async {
    var query =
        " CREATE TABLE $TABLENAME ('id' INTEGER PRIMARY KEY, 'name' TEXT, 'email' TEXT, 'phone' TEXT, 'gender' TEXT, 'isMarried' INTEGER) ";
    await db.execute(query);
  }

  Future<int?> insertData(StudentsModel data) async {
    var db = await _getDatabase();
    return await db?.insert(TABLENAME, data.toJson());
  }

  Future<int?> updateData(StudentsModel data) async {
    var db = await _getDatabase();
    return await db?.update(TABLENAME, data.toJson(),
        where: "id = ?", whereArgs: [data.id]);
  }

  Future<List<StudentsModel>> getData() async {
    var db = await _getDatabase();
    var data = await db?.query(TABLENAME);
    return data?.map((e) => StudentsModel.fromJson(e)).toList()??List<StudentsModel>.empty();
  }

  Future<int?> removeData(int id) async {
    var db = await _getDatabase();
    return await db?.delete(TABLENAME,where: "id = ?",whereArgs: [id]);
  }
}

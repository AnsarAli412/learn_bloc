import 'package:learn_bloc_flutter/sqflite/models/students_model.dart';
import 'package:sqflite/sqflite.dart';

mixin class DatabaseHelper {
  final _dbName = "students.db";
  final TABLENAME = 'students';
  final VERSION = 1;

  Database? database;

  Future<Database?> getDatabase() async {
    if (database != null) return database;
    return await initDatabase();
  }

  Future<String> createDatabase() async {
    var name = getDatabasesPath();
    return "$name/$_dbName";
  }

  Future<Database> initDatabase() async {
    var dbName = await createDatabase();
    return await openDatabase(dbName, version: VERSION, onCreate: _createTable);
  }

  _createTable(Database db, int version) async {
    var query =
        " CREATE TABLE $TABLENAME ('id' INTEGER PRIMARY KEY, 'name' TEXT, 'email' TEXT, 'phone' TEXT, 'gender' TEXT, 'isMarried' INTEGER)";
    await db.query(query);
  }

  Future<int?> insertData(StudentsModel data) async {
    var db = await getDatabase();
    return await db?.insert(TABLENAME, data.toJson());
  }

  Future<int?> updateData(StudentsModel data) async {
    var db = await getDatabase();
    return await db?.update(TABLENAME, data.toJson(),
        where: "id = ?", whereArgs: [data.id]);
  }

  Future<List<StudentsModel>?> getData() async {
    var db = await getDatabase();
    var data = await db?.query(TABLENAME);
    return data?.map((e) => StudentsModel.fromJson(e)).toList();
  }

  Future<int?> removeData(int id) async {
    var db = await getDatabase();
    return await db?.delete(TABLENAME,where: "id = ?",whereArgs: [id]);
  }
}

import 'dart:async';
import 'dart:io' as io;

import 'data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Data(id INTEGER PRIMARY KEY, judul TEXT, ayat TEXT, description TEXT)");
  }

  Future<int> saveData(Datas2 data) async {
    var dbClient = await db;
    int res = await dbClient.insert("Data", data.toMap());
    return res;
  }

  Future<List<Datas2>> getData() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Data');
    List<Datas2> renungan = new List();
    for (int i = 0; i < list.length; i++) {
      var data =
      new Datas2(list[i]["judul"], list[i]["ayat"], list[i]["description"]);
      data.setDataId(list[i]["id"]);
      renungan.add(data);
      print("index: "+ list[i]["id"].toString());
    }
    print(renungan.length);
    return renungan;
  }

  Future<int> deleteData(Datas2 data) async {
    var dbClient = await db;

    int res =
    await dbClient.rawDelete('DELETE FROM Data WHERE id = ?', [data.id]);
    return res;
  }

  Future<bool> update(Datas2 data) async {
    var dbClient = await db;

    int res =   await dbClient.update("Data", data.toMap(),
        where: "id = ?", whereArgs: <int>[data.id]);

    return res > 0 ? true : false;
  }

  Future<List<Datas2>> getDataRenungan() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Data');
    List<Datas2> renungan = new List();
    for (int i = 0; i < list.length; i++) {
      var data =
      new Datas2(list[i]["judul"], list[i]["ayat"], list[i]["description"]);
      data.setDataId(list[i]["id"]);
      renungan.add(data);
      print("index: "+ list[i]["id"].toString());
    }
    print(renungan.length);
    return renungan;
  }

//  Future<int>

}

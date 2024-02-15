import 'dart:async';
import 'dart:io';

import 'package:custom_bloc_state_management/database/table/CartTable.dart';
import 'package:custom_bloc_state_management/database/table/SessionsTable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyAppDatabase {
  static final MyAppDatabase dbProvider = MyAppDatabase();

  static const DATABASE_NAME = "MyDatabase_debug.db";
  static const DATABASE_VERSION = 1;

  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);

    var database = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    CartTable.createTable(database, version);
  }
}

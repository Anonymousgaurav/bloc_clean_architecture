
import 'package:custom_bloc_state_management/database/MyAppDatabase.dart';
import 'package:custom_bloc_state_management/database/table/SessionsTable.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';
import 'package:sqflite/sql.dart';

class SessionDAO {
  final MyAppDatabase dbProvider;

  SessionDAO([MyAppDatabase? dbProvider])
      : dbProvider = dbProvider ?? MyAppDatabase.dbProvider;

  Future<SessionModel> getUser(int id) async {
    final db = await dbProvider.database;
    var res = await db.query(
        SessionsTable.SESSIONS_TABLE_NAME,
        where: "${SessionsTable.SESSIONS_ID} = ?",
        whereArgs: [id],
    );

    List<SessionModel>? sessionModel = res.isNotEmpty ? res.map((row) => SessionModel.fromDatabaseJson(row)).toList() : [];

    return sessionModel.isNotEmpty? sessionModel[0] : const SessionModel.empty();
  }

  Future<bool> insertUser(SessionModel? localSessionModel) async {
    final db = await dbProvider.database;
    final result = await db.insert(SessionsTable.SESSIONS_TABLE_NAME, localSessionModel!.toDatabaseJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return result != 0;
  }

  Future<bool> updateUser(int id, SessionModel localSessionModel) async {
    final db = await dbProvider.database;
    final result = await db.update(
      SessionsTable.SESSIONS_TABLE_NAME,
      localSessionModel.toDatabaseJson(),
      where: "${SessionsTable.SESSIONS_ID} = ?",
      whereArgs: [id],
    );
    return result != 0;
  }

  Future<bool> deleteUser(int id) async {
    final db = await dbProvider.database;
    final result = await db.delete(
        SessionsTable.SESSIONS_TABLE_NAME,
        where: "${SessionsTable.SESSIONS_ID} = ?",
        whereArgs: [id],
    );
    return result != 0;
  }
}

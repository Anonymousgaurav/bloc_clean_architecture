import 'package:sqflite/sqflite.dart';

class SessionsTable {

  static const String SESSIONS_TABLE_NAME = "SESSIONS";
  static const String SESSIONS_ID = "id";
  static const String SESSIONS_SERVER_ID = "server_id";
  static const String SESSIONS_MAIL = "mail";
  static const String SESSIONS_DISPLAY = "display";
  static const String SESSIONS_PIC = "pic";
  static const String SESSIONS_VALIDATION = "mailValidationDone";
  static const String SESSIONS_TOKEN = "token";
  static const String SESSION_TIME = "timestamp";

  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $SESSIONS_TABLE_NAME (
        $SESSIONS_ID INTEGER,
        $SESSIONS_SERVER_ID INTEGER,
        $SESSIONS_MAIL TEXT NOT NULL,
        $SESSIONS_DISPLAY TEXT,
        $SESSIONS_PIC TEXT,
        $SESSIONS_VALIDATION INTEGER NOT NULL,
        $SESSIONS_TOKEN TEXT NOT NULL,
        $SESSION_TIME INTEGER NOT NULL,
        PRIMARY KEY ($SESSIONS_ID)
      )
    ''');
  }

}
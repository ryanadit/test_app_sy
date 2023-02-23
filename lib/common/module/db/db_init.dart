import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbInit {

  Future<Database> get database async {
    // get the default database path
    String databasePath = await getDatabasesPath();

    // join the path with db name
    String path = join(databasePath, 'app.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE user (username TEXT PRIMARY KEY, password TEXT, isLogin TEXT)');
          await db.execute(
              'CREATE TABLE date (id INTEGER PRIMARY KEY AUTOINCREMENT, input TEXT, dateTime TEXT)');
        });

    return database;

  }

}
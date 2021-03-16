import 'package:app_demo_todo/db/todo_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static Database _database;

  // ignore: unnecessary_getters_setters
  Database get database => _database;

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  static const initScripts = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];
  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScripts.forEach((element) async => await db.execute(element));
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationScripts.forEach((element) async => await db.execute(element));
      },
      version: DB_VERSION,
    );
  }
}

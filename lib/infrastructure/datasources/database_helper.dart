import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._(this._db);
  DatabaseHelper.fromExisting(Database db) : _db = db;

  static const _dbName = 'tasks.db';
  static const _dbVersion = 1;
  static const tableTasks = 'tasks';

  final Database _db;

  static Future<DatabaseHelper> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, _dbName);

    final db = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableTasks(
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            is_completed INTEGER NOT NULL DEFAULT 0,
            created_at INTEGER
          );
        ''');
      },
    );

    return DatabaseHelper._(db);
  }

  Database get raw => _db;
}

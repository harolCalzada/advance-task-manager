import 'package:advance_task_manager/domain/entities/task.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

abstract class TaskLocalDataSource {
  Future<List<Task>> getAll();
  Future<Task> insert(Task task);
  Future<Task> toggleCompleted(String id);
  Future<void> delete(String id);
  Future<int> count();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  TaskLocalDataSourceImpl(this._db);

  final DatabaseHelper _db;

  @override
  Future<int> count() async {
    final res = await _db.raw.rawQuery('SELECT COUNT(*) as c FROM ${DatabaseHelper.tableTasks}');
    final c = Sqflite.firstIntValue(res) ?? 0;
    return c;
  }

  @override
  Future<void> delete(String id) async {
    await _db.raw.delete(
      DatabaseHelper.tableTasks,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Task>> getAll() async {
    final rows = await _db.raw.query(DatabaseHelper.tableTasks, orderBy: 'created_at DESC');
    return rows.map(_fromRow).toList(growable: false);
  }

  @override
  Future<Task> insert(Task task) async {
    await _db.raw.insert(
      DatabaseHelper.tableTasks,
      _toRow(task),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return task;
  }

  @override
  Future<Task> toggleCompleted(String id) async {
    final rows = await _db.raw.query(
      DatabaseHelper.tableTasks,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) {
      throw StateError('Task not found: $id');
    }
    final current = _fromRow(rows.first);
    final updated = current.copyWith(isCompleted: !current.isCompleted);
    await _db.raw.update(
      DatabaseHelper.tableTasks,
      {'is_completed': updated.isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
    return updated;
  }

  Map<String, Object?> _toRow(Task t) => {
        'id': t.id,
        'title': t.title,
        'is_completed': t.isCompleted ? 1 : 0,
        'created_at': t.createdAt?.millisecondsSinceEpoch,
      };

  Task _fromRow(Map<String, Object?> row) => Task(
        id: row['id'] as String,
        title: row['title'] as String,
        isCompleted: (row['is_completed'] as int) == 1,
        createdAt: row['created_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(row['created_at'] as int),
      );
}

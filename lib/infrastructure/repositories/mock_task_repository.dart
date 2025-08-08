import 'dart:async';

import 'package:advance_task_manager/domain/entities/task.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';

/// In-memory mock implementation of TaskRepository
class MockTaskRepository implements TaskRepository {
  MockTaskRepository() {
    _tasks = [
      Task(id: '1', title: 'Buy groceries'),
      Task(id: '2', title: 'Read a book'),
      Task(id: '3', title: 'Workout', isCompleted: true),
    ];
  }

  late List<Task> _tasks;
  int _idCounter = 4;

  @override
  Future<List<Task>> fetchTasks() async {
    // Simulate latency
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return List.unmodifiable(_tasks);
  }

  @override
  Future<Task> addTask(String title) async {
    final task = Task(id: (_idCounter++).toString(), title: title);
    _tasks = [..._tasks, task];
    return task;
  }

  @override
  Future<Task> toggleCompleted(String id) async {
    _tasks = _tasks.map((t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t).toList(growable: false);
    return _tasks.firstWhere((t) => t.id == id);
  }

  @override
  Future<Task> update(Task task) async {
    _tasks = _tasks.map((t) => t.id == task.id ? task : t).toList(growable: false);
    return task;
  }

  @override
  Future<void> delete(String id) async {
    _tasks = _tasks.where((t) => t.id != id).toList(growable: false);
  }
}

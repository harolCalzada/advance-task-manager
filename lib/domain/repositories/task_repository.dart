import 'package:advance_task_manager/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<Task> addTask(String title);
  Future<Task> toggleCompleted(String id);
  Future<Task> update(Task task);
  Future<void> delete(String id);
}

import 'package:advance_task_manager/domain/repositories/task_repository.dart';
import 'package:advance_task_manager/domain/entities/task.dart';

/// Concrete implementation placeholder (to be replaced by real data layer)
class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<Task> addTask(String title) {
    throw UnimplementedError('Use MockTaskRepository for now');
  }

  @override
  Future<List<Task>> fetchTasks() {
    throw UnimplementedError('Use MockTaskRepository for now');
  }

  @override
  Future<Task> toggleCompleted(String id) {
    throw UnimplementedError('Use MockTaskRepository for now');
  }
}

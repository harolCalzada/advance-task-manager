import 'package:advance_task_manager/domain/repositories/task_repository.dart';
import 'package:advance_task_manager/domain/entities/task.dart';
import 'package:advance_task_manager/infrastructure/datasources/task_local_data_source.dart';
import 'package:advance_task_manager/infrastructure/datasources/task_remote_data_source.dart';

/// Real repository implementation that coordinates local DB and remote API.
class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required TaskLocalDataSource local, required TaskRemoteDataSource remote})
      : _local = local,
        _remote = remote;

  final TaskLocalDataSource _local;
  final TaskRemoteDataSource _remote;

  @override
  Future<List<Task>> fetchTasks() async {
    // If local DB is empty, hydrate from remote
    final c = await _local.count();
    if (c == 0) {
      final remoteItems = await _remote.fetchInitialTasks();
      for (final t in remoteItems) {
        await _local.insert(t);
      }
    }
    return _local.getAll();
  }

  @override
  Future<Task> toggleCompleted(String id) async {
    return _local.toggleCompleted(id);
  }

  @override
  Future<Task> addTask(String title) async {
    final t = Task(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    return _local.insert(t);
  }
}

import 'package:advance_task_manager/domain/entities/task.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';

class GetTasksUseCase {
  const GetTasksUseCase(this._repository);

  final TaskRepository _repository;

  Future<List<Task>> call() {
    return _repository.fetchTasks();
  }
}

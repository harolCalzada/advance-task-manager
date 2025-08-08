import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';

class ToggleTaskCompletedUseCase {
  const ToggleTaskCompletedUseCase(this._repository);

  final TaskRepository _repository;

  Future<Task> call(String id) {
    return _repository.toggleCompleted(id);
  }
}

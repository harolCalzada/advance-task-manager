import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  const UpdateTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<Task> call(Task task) {
    return _repository.update(task);
  }
}

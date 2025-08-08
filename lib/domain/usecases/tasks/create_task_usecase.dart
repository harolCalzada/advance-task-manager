import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';

class CreateTaskUseCase {
  const CreateTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<Task> call(String title) {
    return _repository.addTask(title);
  }
}

import 'package:advance_task_manager/domain/repositories/task_repository.dart';

class DeleteTaskUseCase {
  const DeleteTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call(String id) {
    return _repository.delete(id);
  }
}

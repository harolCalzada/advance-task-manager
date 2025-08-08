import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';
import 'package:advance_task_manager/domain/usecases/tasks/toggle_task_completed_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeTaskRepository implements TaskRepository {
  _FakeTaskRepository(this._store);
  final Map<String, Task> _store;

  @override
  Future<Task> addTask(String title) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> fetchTasks() async => _store.values.toList(growable: false);

  @override
  Future<Task> toggleCompleted(String id) async {
    final current = _store[id]!;
    final updated = current.copyWith(isCompleted: !current.isCompleted);
    _store[id] = updated;
    return updated;
  }

  @override
  Future<Task> update(Task task) async {
    _store[task.id] = task;
    return task;
  }
}

void main() {
  group('ToggleTaskCompletedUseCase', () {
    test('toggles completion state and returns updated task', () async {
      final initial = Task(id: '1', title: 'Test', isCompleted: false, createdAt: DateTime(2024, 1, 1));
      final repo = _FakeTaskRepository({'1': initial});
      final usecase = ToggleTaskCompletedUseCase(repo);

      final result = await usecase('1');

      expect(result.id, '1');
      expect(result.isCompleted, isTrue);
      expect(repo.fetchTasks(), completion(contains(result)));
    });
  });
}

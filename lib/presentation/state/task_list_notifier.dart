import 'package:advance_task_manager/domain/entities/task.dart';
import 'package:advance_task_manager/domain/usecases/get_tasks_usecase.dart';
import 'package:advance_task_manager/infrastructure/repositories/mock_task_repository.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list_notifier.freezed.dart';

enum TaskFilter { all, pending, completed }

@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState({
    @Default(<Task>[]) List<Task> tasks,
    @Default(TaskFilter.all) TaskFilter filter,
    @Default(false) bool isLoading,
  }) = _TaskListState;
}

final getTasksUseCaseProvider = Provider<GetTasksUseCase>((ref) {
  final repo = ref.watch(taskRepositoryProvider);
  return GetTasksUseCase(repo);
});

final taskListNotifierProvider =
    StateNotifierProvider<TaskListNotifier, TaskListState>((ref) {
  final getTasks = ref.watch(getTasksUseCaseProvider);
  final repo = ref.watch(taskRepositoryProvider);
  return TaskListNotifier(getTasks: getTasks, repositoryAccess: repo);
});

class TaskListNotifier extends StateNotifier<TaskListState> {
  TaskListNotifier({required GetTasksUseCase getTasks, required TaskRepository repositoryAccess})
      : _getTasks = getTasks,
        _repository = repositoryAccess,
        super(const TaskListState());

  final GetTasksUseCase _getTasks;
  final TaskRepository _repository;

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true);
    final items = await _getTasks();
    state = state.copyWith(tasks: items, isLoading: false);
  }

  Future<void> addTask(String title) async {
    final added = await _repository.addTask(title);
    state = state.copyWith(tasks: [...state.tasks, added]);
  }

  Future<void> toggleCompleted(String id) async {
    final updated = await _repository.toggleCompleted(id);
    final next = state.tasks
        .map((t) => t.id == id ? updated : t)
        .toList(growable: false);
    state = state.copyWith(tasks: next);
  }

  void setFilter(TaskFilter filter) {
    state = state.copyWith(filter: filter);
  }

  List<Task> get filteredTasks {
    switch (state.filter) {
      case TaskFilter.all:
        return state.tasks;
      case TaskFilter.pending:
        return state.tasks.where((t) => !t.isCompleted).toList(growable: false);
      case TaskFilter.completed:
        return state.tasks.where((t) => t.isCompleted).toList(growable: false);
    }
  }
}

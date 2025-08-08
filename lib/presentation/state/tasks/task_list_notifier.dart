import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:advance_task_manager/domain/usecases/tasks/get_tasks_usecase.dart';
import 'package:advance_task_manager/domain/usecases/tasks/create_task_usecase.dart';
import 'package:advance_task_manager/domain/usecases/tasks/update_task_usecase.dart';
import 'package:advance_task_manager/domain/usecases/tasks/toggle_task_completed_usecase.dart';
import 'package:advance_task_manager/domain/usecases/tasks/delete_task_usecase.dart';
import 'package:advance_task_manager/core/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list_notifier.freezed.dart';

enum TaskFilter { all, pending, completed }

// UI state union: loading, data, error
@freezed
sealed class TaskListState with _$TaskListState {
  const factory TaskListState.loading() = _Loading;
  const factory TaskListState.data({
    @Default(<Task>[]) List<Task> tasks,
    @Default(TaskFilter.all) TaskFilter filter,
  }) = _Data;
  const factory TaskListState.error(String message) = _Error;
}

final getTasksUseCaseProvider = FutureProvider<GetTasksUseCase>((ref) async {
  final repo = await ref.watch(taskRepositoryProvider.future);
  return GetTasksUseCase(repo);
});

final createTaskUseCaseProvider = FutureProvider<CreateTaskUseCase>((ref) async {
  final repo = await ref.watch(taskRepositoryProvider.future);
  return CreateTaskUseCase(repo);
});

final updateTaskUseCaseProvider = FutureProvider<UpdateTaskUseCase>((ref) async {
  final repo = await ref.watch(taskRepositoryProvider.future);
  return UpdateTaskUseCase(repo);
});

final toggleTaskCompletedUseCaseProvider = FutureProvider<ToggleTaskCompletedUseCase>((ref) async {
  final repo = await ref.watch(taskRepositoryProvider.future);
  return ToggleTaskCompletedUseCase(repo);
});

final deleteTaskUseCaseProvider = FutureProvider<DeleteTaskUseCase>((ref) async {
  final repo = await ref.watch(taskRepositoryProvider.future);
  return DeleteTaskUseCase(repo);
});

final taskListNotifierProvider = StateNotifierProvider<TaskListNotifier, TaskListState>((ref) {
  return TaskListNotifier(ref);
});

class TaskListNotifier extends StateNotifier<TaskListState> {
  TaskListNotifier(this._ref) : super(const TaskListState.loading());

  final Ref _ref;

  Future<void> loadInitial() async {
    state = const TaskListState.loading();
    try {
      final getTasks = await _ref.read(getTasksUseCaseProvider.future);
      final items = await getTasks();
      state = TaskListState.data(tasks: items);
    } catch (e) {
      state = TaskListState.error(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final usecase = await _ref.read(updateTaskUseCaseProvider.future);
      final updated = await usecase(task);
      state = state.maybeWhen(
        data: (tasks, filter) {
          final next = tasks.map((t) => t.id == updated.id ? updated : t).toList(growable: false);
          return TaskListState.data(tasks: next, filter: filter);
        },
        orElse: () => state,
      );
    } catch (e) {
      state = TaskListState.error(e.toString());
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      final usecase = await _ref.read(deleteTaskUseCaseProvider.future);
      await usecase(id);
      state = state.maybeWhen(
        data: (tasks, filter) {
          final next = tasks.where((t) => t.id != id).toList(growable: false);
          return TaskListState.data(tasks: next, filter: filter);
        },
        orElse: () => state,
      );
    } catch (e) {
      state = TaskListState.error(e.toString());
    }
  }

  Future<void> addTask(String title) async {
    try {
      final usecase = await _ref.read(createTaskUseCaseProvider.future);
      final added = await usecase(title);
      state = state.maybeWhen(
        data: (tasks, filter) => TaskListState.data(tasks: [added, ...tasks], filter: filter),
        orElse: () => state,
      );
    } catch (e) {
      state = TaskListState.error(e.toString());
    }
  }

  Future<void> toggleCompleted(String id) async {
    try {
      final usecase = await _ref.read(toggleTaskCompletedUseCaseProvider.future);
      final updated = await usecase(id);
      state = state.maybeWhen(
        data: (tasks, filter) {
          final next = tasks.map((t) => t.id == id ? updated : t).toList(growable: false);
          return TaskListState.data(tasks: next, filter: filter);
        },
        orElse: () => state,
      );
    } catch (e) {
      state = TaskListState.error(e.toString());
    }
  }

  void setFilter(TaskFilter filter) {
    state = state.maybeWhen(
      data: (tasks, _) => TaskListState.data(tasks: tasks, filter: filter),
      orElse: () => state,
    );
  }

  List<Task> get filteredTasks {
    return state.maybeWhen(
      data: (tasks, filter) {
        switch (filter) {
          case TaskFilter.all:
            return tasks;
          case TaskFilter.pending:
            return tasks.where((t) => !t.isCompleted).toList(growable: false);
          case TaskFilter.completed:
            return tasks.where((t) => t.isCompleted).toList(growable: false);
        }
      },
      orElse: () => const <Task>[],
    );
  }
}

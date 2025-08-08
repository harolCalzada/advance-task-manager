import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:advance_task_manager/presentation/state/tasks/task_list_notifier.dart';
import 'package:advance_task_manager/presentation/pages/task_create_page.dart';
import 'package:advance_task_manager/presentation/widgets/error_view.dart';
import 'package:advance_task_manager/presentation/widgets/filter_chips.dart';
import 'package:advance_task_manager/presentation/widgets/task_detail_sheet.dart';

class TaskListPage extends ConsumerStatefulWidget {
  const TaskListPage({super.key});

  @override
  ConsumerState<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends ConsumerState<TaskListPage> {
  @override
  void initState() {
    super.initState();
    // Load initial tasks
    Future.microtask(() => ref.read(taskListNotifierProvider.notifier).loadInitial());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(taskListNotifierProvider);
    final notifier = ref.read(taskListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Task Manager'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.maybeWhen(
            loading: () => const LinearProgressIndicator(minHeight: 2),
            orElse: () => const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: state.maybeWhen(
              data: (tasks, filter) => FilterChips(
                selected: filter,
                onSelected: notifier.setFilter,
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => ErrorView(message: message, onRetry: notifier.loadInitial),
              data: (tasks, filter) => ListView.builder(
                itemCount: notifier.filteredTasks.length,
                itemBuilder: (context, index) {
                  final task = notifier.filteredTasks[index];
                  return ListTile(
                    onTap: () => showTaskDetailSheet(context, task, notifier),
                    title: Text(task.title),
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (_) => notifier.toggleCompleted(task.id),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await Navigator.of(
            context,
          ).push<String>(MaterialPageRoute(builder: (_) => const TaskCreatePage()));
          if (title != null && title.trim().isNotEmpty) {
            await notifier.addTask(title.trim());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Widgets moved to:
// lib/presentation/pages/task_list/widgets/error_view.dart
// lib/presentation/pages/task_list/widgets/filter_chips.dart

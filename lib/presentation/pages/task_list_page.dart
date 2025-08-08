import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:advance_task_manager/presentation/state/task_list_notifier.dart';
import 'package:advance_task_manager/presentation/pages/task_create_page.dart';

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
          if (state.isLoading)
            const LinearProgressIndicator(minHeight: 2),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: _FilterChips(
              selected: state.filter,
              onSelected: notifier.setFilter,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: notifier.filteredTasks.length,
              itemBuilder: (context, index) {
                final task = notifier.filteredTasks[index];
                return CheckboxListTile(
                  title: Text(task.title),
                  value: task.isCompleted,
                  onChanged: (_) => notifier.toggleCompleted(task.id),
                );
              },
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

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.selected, required this.onSelected});

  final TaskFilter selected;
  final void Function(TaskFilter) onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
          label: const Text('All'),
          selected: selected == TaskFilter.all,
          onSelected: (_) => onSelected(TaskFilter.all),
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text('Pending'),
          selected: selected == TaskFilter.pending,
          onSelected: (_) => onSelected(TaskFilter.pending),
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text('Completed'),
          selected: selected == TaskFilter.completed,
          onSelected: (_) => onSelected(TaskFilter.completed),
        ),
      ],
    );
  }
}

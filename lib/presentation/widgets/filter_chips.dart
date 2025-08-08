import 'package:flutter/material.dart';
import 'package:advance_task_manager/presentation/state/tasks/task_list_notifier.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key, required this.selected, required this.onSelected});

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

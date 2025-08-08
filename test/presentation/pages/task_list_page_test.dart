import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:advance_task_manager/presentation/pages/task_list_page.dart';
import 'package:advance_task_manager/presentation/state/tasks/task_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeTaskListNotifier extends TaskListNotifier {
  _FakeTaskListNotifier(Ref ref) : super(ref) {
    state = TaskListState.data(tasks: [
      Task(id: '1', title: 'Buy milk', isCompleted: false, createdAt: DateTime(2025, 8, 1)),
      Task(id: '2', title: 'Do Tech challenge', isCompleted: true, createdAt: DateTime(2025, 8, 2)),
    ]);
  }

  @override
  Future<void> loadInitial() async {}
}

void main() {
  testWidgets('TaskListPage shows tasks', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          taskListNotifierProvider.overrideWith((ref) => _FakeTaskListNotifier(ref)),
        ],
        child: const MaterialApp(home: TaskListPage()),
      ),
    );

    // First frame
    await tester.pumpAndSettle();

    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('Do Tech challenge'), findsOneWidget);

    // Filter to completed
    await tester.tap(find.text('Completed'));
    await tester.pump();

    // Now only completed task should be visible
    expect(find.text('Buy milk'), findsNothing);
    expect(find.text('Do Tech challenge'), findsOneWidget);
  });
}

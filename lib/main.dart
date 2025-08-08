import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:advance_task_manager/presentation/pages/task_list_page.dart';
import 'package:advance_task_manager/core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: AdvancedTaskManagerApp()));
}

class AdvancedTaskManagerApp extends StatelessWidget {
  const AdvancedTaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Task Manager',
      theme: AppTheme.light,
      home: const TaskListPage(),
    );
  }
}

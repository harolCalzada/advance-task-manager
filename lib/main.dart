import 'package:flutter/material.dart';
import 'package:advance_task_manager/presentation/pages/task_list_page.dart';

void main() {
  runApp(const AdvancedTaskManagerApp());
}

class AdvancedTaskManagerApp extends StatelessWidget {
  const AdvancedTaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Task Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const TaskListPage(),
    );
  }
}

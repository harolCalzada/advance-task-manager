import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:advance_task_manager/presentation/pages/task_list_page.dart';
import 'package:advance_task_manager/presentation/pages/countries_page.dart';
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
      home: const _HomeShell(),
    );
  }
}

class _HomeShell extends StatefulWidget {
  const _HomeShell();

  @override
  State<_HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<_HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          TaskListPage(),
          CountriesPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.checklist_outlined), label: 'Tasks'),
          NavigationDestination(icon: Icon(Icons.flag_outlined), label: 'Countries'),
        ],
        onDestinationSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}

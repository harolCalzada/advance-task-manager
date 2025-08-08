import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:advance_task_manager/main.dart';

void main() {
  testWidgets('App boots to TaskListPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AdvancedTaskManagerApp());

    // Verify that the placeholder page is rendered.
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Task List Page'), findsOneWidget);
  });
}

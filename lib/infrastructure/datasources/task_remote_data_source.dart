import 'dart:convert';

import 'package:advance_task_manager/domain/entities/tasks/task.dart';
import 'package:http/http.dart' as http;

abstract class TaskRemoteDataSource {
  Future<List<Task>> fetchInitialTasks();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  TaskRemoteDataSourceImpl(this._client);

  final http.Client _client;

  static const _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<Task>> fetchInitialTasks() async {
    final res = await _client.get(Uri.parse(_baseUrl));
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Failed to fetch tasks: ${res.statusCode}');
    }
    final data = json.decode(res.body) as List<dynamic>;

    final now = DateTime.now();
    return data.take(20).map((e) {
      final map = e as Map<String, dynamic>;
      return Task(
        id: (map['id']).toString(),
        title: map['title'] as String,
        isCompleted: (map['completed'] as bool?) ?? false,
        createdAt: now,
      );
    }).toList(growable: false);
  }
}

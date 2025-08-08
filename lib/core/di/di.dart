import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:advance_task_manager/infrastructure/datasources/database_helper.dart';
import 'package:advance_task_manager/infrastructure/datasources/task_local_data_source.dart';
import 'package:advance_task_manager/infrastructure/datasources/task_remote_data_source.dart';
import 'package:advance_task_manager/infrastructure/repositories/task_repository_impl.dart';
import 'package:advance_task_manager/domain/repositories/task_repository.dart';
import 'package:advance_task_manager/infrastructure/datasources/country_remote_data_source.dart';
import 'package:advance_task_manager/infrastructure/repositories/country_repository_impl.dart';
import 'package:advance_task_manager/domain/repositories/country_repository.dart';

// HTTP Client
final httpClientProvider = Provider<http.Client>((ref) => http.Client());

// Database helper
final databaseHelperProvider = FutureProvider<DatabaseHelper>((ref) async {
  return DatabaseHelper.create();
});

// Local datasource
final taskLocalDataSourceProvider = FutureProvider<TaskLocalDataSource>((ref) async {
  final db = await ref.watch(databaseHelperProvider.future);
  return TaskLocalDataSourceImpl(db);
});

// Remote datasource
final taskRemoteDataSourceProvider = Provider<TaskRemoteDataSource>((ref) {
  final client = ref.watch(httpClientProvider);
  return TaskRemoteDataSourceImpl(client);
});

final taskRepositoryProvider = FutureProvider<TaskRepository>((ref) async {
  final local = await ref.watch(taskLocalDataSourceProvider.future);
  final remote = ref.watch(taskRemoteDataSourceProvider);
  return TaskRepositoryImpl(local: local, remote: remote);
});

// Countries: remote datasource
final countryRemoteDataSourceProvider = Provider<CountryRemoteDataSource>((ref) {
  final client = ref.watch(httpClientProvider);
  return CountryRemoteDataSourceImpl(client);
});

final countryRepositoryProvider = Provider<CountryRepository>((ref) {
  final remote = ref.watch(countryRemoteDataSourceProvider);
  return CountryRepositoryImpl(remote);
});

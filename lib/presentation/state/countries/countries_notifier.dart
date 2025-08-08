import 'package:advance_task_manager/core/di/di.dart';
import 'package:advance_task_manager/domain/entities/countries/country.dart';
import 'package:advance_task_manager/domain/usecases/countries/get_countries_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'countries_notifier.freezed.dart';

@freezed
class CountriesState with _$CountriesState {
  const factory CountriesState.loading() = _Loading;
  const factory CountriesState.data(List<Country> countries) = _Data;
  const factory CountriesState.error(String message) = _Error;
}

class CountriesNotifier extends StateNotifier<CountriesState> {
  CountriesNotifier(this._getCountries) : super(const CountriesState.loading());

  final GetCountriesUseCase _getCountries;

  Future<void> load() async {
    state = const CountriesState.loading();
    try {
      final list = await _getCountries();
      state = CountriesState.data(list);
    } catch (e) {
      state = CountriesState.error(e.toString());
    }
  }
}

final getCountriesUseCaseProvider = Provider<GetCountriesUseCase>((ref) {
  final repo = ref.watch(countryRepositoryProvider);
  return GetCountriesUseCase(repo);
});

final countriesNotifierProvider = StateNotifierProvider<CountriesNotifier, CountriesState>((ref) {
  final uc = ref.watch(getCountriesUseCaseProvider);
  final notifier = CountriesNotifier(uc);
  // fire and forget
  notifier.load();
  return notifier;
});

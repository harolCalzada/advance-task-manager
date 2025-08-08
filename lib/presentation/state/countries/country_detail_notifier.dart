import 'package:advance_task_manager/core/di/di.dart';
import 'package:advance_task_manager/domain/entities/countries/country_detail.dart';
import 'package:advance_task_manager/domain/usecases/countries/get_country_detail_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'country_detail_notifier.freezed.dart';

@freezed
abstract class CountryDetailState with _$CountryDetailState {
  const factory CountryDetailState.loading() = _Loading;
  const factory CountryDetailState.data(CountryDetail detail) = _Data;
  const factory CountryDetailState.error(String message) = _Error;
}

class CountryDetailNotifier extends StateNotifier<CountryDetailState> {
  CountryDetailNotifier(this._getDetail) : super(const CountryDetailState.loading());
  final GetCountryDetailUseCase _getDetail;

  Future<void> load(String code) async {
    state = const CountryDetailState.loading();
    try {
      final detail = await _getDetail(code);
      state = CountryDetailState.data(detail);
    } catch (e) {
      state = CountryDetailState.error(e.toString());
    }
  }
}

final getCountryDetailUseCaseProvider = Provider<GetCountryDetailUseCase>((ref) {
  final repo = ref.watch(countryRepositoryProvider);
  return GetCountryDetailUseCase(repo);
});

final countryDetailNotifierProvider =
    StateNotifierProvider.autoDispose.family<CountryDetailNotifier, CountryDetailState, String>((ref, code) {
  final uc = ref.watch(getCountryDetailUseCaseProvider);
  final notifier = CountryDetailNotifier(uc);
  notifier.load(code);
  return notifier;
});

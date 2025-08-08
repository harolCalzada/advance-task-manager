import 'package:advance_task_manager/domain/entities/countries/country_detail.dart';
import 'package:advance_task_manager/domain/repositories/country_repository.dart';

class GetCountryDetailUseCase {
  const GetCountryDetailUseCase(this._repository);

  final CountryRepository _repository;

  Future<CountryDetail> call(String code) {
    return _repository.fetchCountryDetail(code);
  }
}

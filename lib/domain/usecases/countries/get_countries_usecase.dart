import 'package:advance_task_manager/domain/entities/countries/country.dart';
import 'package:advance_task_manager/domain/repositories/country_repository.dart';

class GetCountriesUseCase {
  const GetCountriesUseCase(this._repository);

  final CountryRepository _repository;

  Future<List<Country>> call() {
    return _repository.fetchCountries();
  }
}

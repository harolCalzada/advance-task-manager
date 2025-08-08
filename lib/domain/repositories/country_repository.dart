import 'package:advance_task_manager/domain/entities/countries/country.dart';
import 'package:advance_task_manager/domain/entities/countries/country_detail.dart';

abstract class CountryRepository {
  Future<List<Country>> fetchCountries();
  Future<CountryDetail> fetchCountryDetail(String code);
}

import 'package:advance_task_manager/domain/entities/countries/country.dart';
import 'package:advance_task_manager/domain/repositories/country_repository.dart';
import 'package:advance_task_manager/infrastructure/datasources/country_remote_data_source.dart';
import 'package:advance_task_manager/domain/entities/countries/country_detail.dart';

class CountryRepositoryImpl implements CountryRepository {
  CountryRepositoryImpl(this._remote);

  final CountryRemoteDataSource _remote;

  @override
  Future<List<Country>> fetchCountries() => _remote.fetchCountries();

  @override
  Future<CountryDetail> fetchCountryDetail(String code) => _remote.fetchCountryDetail(code);
}

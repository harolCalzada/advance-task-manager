import 'dart:convert';

import 'package:advance_task_manager/domain/entities/countries/country.dart';
import 'package:advance_task_manager/domain/entities/countries/country_detail.dart';
import 'package:http/http.dart' as http;

abstract class CountryRemoteDataSource {
  Future<List<Country>> fetchCountries();
  Future<CountryDetail> fetchCountryDetail(String code);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  CountryRemoteDataSourceImpl(this._client);

  final http.Client _client;
  static const _endpoint = 'https://countries.trevorblades.com/';

  @override
  Future<List<Country>> fetchCountries() async {
    const query = r'''query { countries { code name emoji } }''';
    final response = await _client.post(
      Uri.parse(_endpoint),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({'query': query}),
    );

    if (response.statusCode != 200) {
      throw Exception('GraphQL error: HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> json = jsonDecode(response.body) as Map<String, dynamic>;
    final data = json['data'] as Map<String, dynamic>?;
    if (data == null || data['countries'] == null) {
      throw Exception('Invalid GraphQL response');
    }

    final List<dynamic> list = data['countries'] as List<dynamic>;
    return list
        .map((e) => Country.fromJson({
              'code': (e as Map<String, dynamic>)['code'] as String,
              'name': e['name'] as String,
              'emoji': e['emoji'] as String,
            }))
        .toList(growable: false);
  }

  @override
  Future<CountryDetail> fetchCountryDetail(String code) async {
    const query = r'''query ($code: ID!) {
      country(code: $code) {
        code
        name
        emoji
        capital
        continent { name }
        currency
        languages { name }
      }
    }''';

    final response = await _client.post(
      Uri.parse(_endpoint),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        'query': query,
        'variables': {'code': code}
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('GraphQL error: HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> json = jsonDecode(response.body) as Map<String, dynamic>;
    final data = (json['data'] as Map<String, dynamic>?)?['country'] as Map<String, dynamic>?;
    if (data == null) throw Exception('Country not found');

    return CountryDetail.fromJson({
      'code': data['code'] as String,
      'name': data['name'] as String,
      'emoji': data['emoji'] as String,
      'capital': data['capital'] as String?,
      'continentName': (data['continent'] as Map<String, dynamic>)['name'] as String,
      'currency': data['currency'] as String?,
      'languages': ((data['languages'] as List<dynamic>?) ?? const [])
          .map((e) => (e as Map<String, dynamic>)['name'] as String)
          .toList(growable: false),
    });
  }
}

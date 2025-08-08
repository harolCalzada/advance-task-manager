import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_detail.freezed.dart';
part 'country_detail.g.dart';

@freezed
abstract class CountryDetail with _$CountryDetail {
  const factory CountryDetail({
    required String code,
    required String name,
    required String emoji,
    String? capital,
    required String continentName,
    String? currency,
    @Default(<String>[]) List<String> languages,
  }) = _CountryDetail;

  factory CountryDetail.fromJson(Map<String, dynamic> json) => _$CountryDetailFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountryDetail _$CountryDetailFromJson(Map<String, dynamic> json) =>
    _CountryDetail(
      code: json['code'] as String,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      capital: json['capital'] as String?,
      continentName: json['continentName'] as String,
      currency: json['currency'] as String?,
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$CountryDetailToJson(_CountryDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'emoji': instance.emoji,
      'capital': instance.capital,
      'continentName': instance.continentName,
      'currency': instance.currency,
      'languages': instance.languages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryDetail {
  String get code;
  String get name;
  String get emoji;
  String? get capital;
  String get continentName;
  String? get currency;
  List<String> get languages;

  /// Create a copy of CountryDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryDetailCopyWith<CountryDetail> get copyWith =>
      _$CountryDetailCopyWithImpl<CountryDetail>(
          this as CountryDetail, _$identity);

  /// Serializes this CountryDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountryDetail &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.continentName, continentName) ||
                other.continentName == continentName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other.languages, languages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, emoji, capital,
      continentName, currency, const DeepCollectionEquality().hash(languages));

  @override
  String toString() {
    return 'CountryDetail(code: $code, name: $name, emoji: $emoji, capital: $capital, continentName: $continentName, currency: $currency, languages: $languages)';
  }
}

/// @nodoc
abstract mixin class $CountryDetailCopyWith<$Res> {
  factory $CountryDetailCopyWith(
          CountryDetail value, $Res Function(CountryDetail) _then) =
      _$CountryDetailCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      String name,
      String emoji,
      String? capital,
      String continentName,
      String? currency,
      List<String> languages});
}

/// @nodoc
class _$CountryDetailCopyWithImpl<$Res>
    implements $CountryDetailCopyWith<$Res> {
  _$CountryDetailCopyWithImpl(this._self, this._then);

  final CountryDetail _self;
  final $Res Function(CountryDetail) _then;

  /// Create a copy of CountryDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? emoji = null,
    Object? capital = freezed,
    Object? continentName = null,
    Object? currency = freezed,
    Object? languages = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _self.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      capital: freezed == capital
          ? _self.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String?,
      continentName: null == continentName
          ? _self.continentName
          : continentName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: null == languages
          ? _self.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CountryDetail].
extension CountryDetailPatterns on CountryDetail {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountryDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountryDetail() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountryDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountryDetail():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountryDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountryDetail() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String name, String emoji, String? capital,
            String continentName, String? currency, List<String> languages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountryDetail() when $default != null:
        return $default(_that.code, _that.name, _that.emoji, _that.capital,
            _that.continentName, _that.currency, _that.languages);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String name, String emoji, String? capital,
            String continentName, String? currency, List<String> languages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountryDetail():
        return $default(_that.code, _that.name, _that.emoji, _that.capital,
            _that.continentName, _that.currency, _that.languages);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String name, String emoji, String? capital,
            String continentName, String? currency, List<String> languages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountryDetail() when $default != null:
        return $default(_that.code, _that.name, _that.emoji, _that.capital,
            _that.continentName, _that.currency, _that.languages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CountryDetail implements CountryDetail {
  const _CountryDetail(
      {required this.code,
      required this.name,
      required this.emoji,
      this.capital,
      required this.continentName,
      this.currency,
      final List<String> languages = const <String>[]})
      : _languages = languages;
  factory _CountryDetail.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String emoji;
  @override
  final String? capital;
  @override
  final String continentName;
  @override
  final String? currency;
  final List<String> _languages;
  @override
  @JsonKey()
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  /// Create a copy of CountryDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryDetailCopyWith<_CountryDetail> get copyWith =>
      __$CountryDetailCopyWithImpl<_CountryDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryDetail &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.continentName, continentName) ||
                other.continentName == continentName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, emoji, capital,
      continentName, currency, const DeepCollectionEquality().hash(_languages));

  @override
  String toString() {
    return 'CountryDetail(code: $code, name: $name, emoji: $emoji, capital: $capital, continentName: $continentName, currency: $currency, languages: $languages)';
  }
}

/// @nodoc
abstract mixin class _$CountryDetailCopyWith<$Res>
    implements $CountryDetailCopyWith<$Res> {
  factory _$CountryDetailCopyWith(
          _CountryDetail value, $Res Function(_CountryDetail) _then) =
      __$CountryDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String emoji,
      String? capital,
      String continentName,
      String? currency,
      List<String> languages});
}

/// @nodoc
class __$CountryDetailCopyWithImpl<$Res>
    implements _$CountryDetailCopyWith<$Res> {
  __$CountryDetailCopyWithImpl(this._self, this._then);

  final _CountryDetail _self;
  final $Res Function(_CountryDetail) _then;

  /// Create a copy of CountryDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? emoji = null,
    Object? capital = freezed,
    Object? continentName = null,
    Object? currency = freezed,
    Object? languages = null,
  }) {
    return _then(_CountryDetail(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _self.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      capital: freezed == capital
          ? _self.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String?,
      continentName: null == continentName
          ? _self.continentName
          : continentName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: null == languages
          ? _self._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on

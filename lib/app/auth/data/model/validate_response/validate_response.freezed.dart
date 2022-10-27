// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'validate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateResponse _$ValidateResponseFromJson(Map<String, dynamic> json) {
  return _ValidateResponse.fromJson(json);
}

/// @nodoc
mixin _$ValidateResponse {
  @JsonKey(name: 'token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateResponseCopyWith<ValidateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateResponseCopyWith<$Res> {
  factory $ValidateResponseCopyWith(
          ValidateResponse value, $Res Function(ValidateResponse) then) =
      _$ValidateResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'token') String? token,
      @JsonKey(name: 'full_name') String? fullName});
}

/// @nodoc
class _$ValidateResponseCopyWithImpl<$Res>
    implements $ValidateResponseCopyWith<$Res> {
  _$ValidateResponseCopyWithImpl(this._value, this._then);

  final ValidateResponse _value;
  // ignore: unused_field
  final $Res Function(ValidateResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ValidateResponseCopyWith<$Res>
    implements $ValidateResponseCopyWith<$Res> {
  factory _$$_ValidateResponseCopyWith(
          _$_ValidateResponse value, $Res Function(_$_ValidateResponse) then) =
      __$$_ValidateResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'token') String? token,
      @JsonKey(name: 'full_name') String? fullName});
}

/// @nodoc
class __$$_ValidateResponseCopyWithImpl<$Res>
    extends _$ValidateResponseCopyWithImpl<$Res>
    implements _$$_ValidateResponseCopyWith<$Res> {
  __$$_ValidateResponseCopyWithImpl(
      _$_ValidateResponse _value, $Res Function(_$_ValidateResponse) _then)
      : super(_value, (v) => _then(v as _$_ValidateResponse));

  @override
  _$_ValidateResponse get _value => super._value as _$_ValidateResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_ValidateResponse(
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidateResponse implements _ValidateResponse {
  _$_ValidateResponse(@JsonKey(name: 'token') this.token,
      @JsonKey(name: 'full_name') this.fullName);

  factory _$_ValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ValidateResponseFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String? token;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;

  @override
  String toString() {
    return 'ValidateResponse(token: $token, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateResponse &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$_ValidateResponseCopyWith<_$_ValidateResponse> get copyWith =>
      __$$_ValidateResponseCopyWithImpl<_$_ValidateResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidateResponseToJson(
      this,
    );
  }
}

abstract class _ValidateResponse implements ValidateResponse {
  factory _ValidateResponse(@JsonKey(name: 'token') final String? token,
      @JsonKey(name: 'full_name') final String? fullName) = _$_ValidateResponse;

  factory _ValidateResponse.fromJson(Map<String, dynamic> json) =
      _$_ValidateResponse.fromJson;

  @override
  @JsonKey(name: 'token')
  String? get token;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_ValidateResponseCopyWith<_$_ValidateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

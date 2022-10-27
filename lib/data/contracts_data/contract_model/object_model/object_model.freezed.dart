// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'object_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Objects _$ObjectsFromJson(Map<String, dynamic> json) {
  return _Objects.fromJson(json);
}

/// @nodoc
mixin _$Objects {
  @JsonKey(name: 'AdressObjectProtection')
  String? get addressName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObjectsCopyWith<Objects> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectsCopyWith<$Res> {
  factory $ObjectsCopyWith(Objects value, $Res Function(Objects) then) =
      _$ObjectsCopyWithImpl<$Res, Objects>;
  @useResult
  $Res call({@JsonKey(name: 'AdressObjectProtection') String? addressName});
}

/// @nodoc
class _$ObjectsCopyWithImpl<$Res, $Val extends Objects>
    implements $ObjectsCopyWith<$Res> {
  _$ObjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = freezed,
  }) {
    return _then(_value.copyWith(
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObjectsCopyWith<$Res> implements $ObjectsCopyWith<$Res> {
  factory _$$_ObjectsCopyWith(
          _$_Objects value, $Res Function(_$_Objects) then) =
      __$$_ObjectsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'AdressObjectProtection') String? addressName});
}

/// @nodoc
class __$$_ObjectsCopyWithImpl<$Res>
    extends _$ObjectsCopyWithImpl<$Res, _$_Objects>
    implements _$$_ObjectsCopyWith<$Res> {
  __$$_ObjectsCopyWithImpl(_$_Objects _value, $Res Function(_$_Objects) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = freezed,
  }) {
    return _then(_$_Objects(
      freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Objects implements _Objects {
  _$_Objects(@JsonKey(name: 'AdressObjectProtection') this.addressName);

  factory _$_Objects.fromJson(Map<String, dynamic> json) =>
      _$$_ObjectsFromJson(json);

  @override
  @JsonKey(name: 'AdressObjectProtection')
  final String? addressName;

  @override
  String toString() {
    return 'Objects(addressName: $addressName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Objects &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addressName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObjectsCopyWith<_$_Objects> get copyWith =>
      __$$_ObjectsCopyWithImpl<_$_Objects>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObjectsToJson(
      this,
    );
  }
}

abstract class _Objects implements Objects {
  factory _Objects(
          @JsonKey(name: 'AdressObjectProtection') final String? addressName) =
      _$_Objects;

  factory _Objects.fromJson(Map<String, dynamic> json) = _$_Objects.fromJson;

  @override
  @JsonKey(name: 'AdressObjectProtection')
  String? get addressName;
  @override
  @JsonKey(ignore: true)
  _$$_ObjectsCopyWith<_$_Objects> get copyWith =>
      throw _privateConstructorUsedError;
}

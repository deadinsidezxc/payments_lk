// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'security_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SecurityData {
  SosStatus? get sosStatus => throw _privateConstructorUsedError;
  ElectricityStatus? get electricityStatus =>
      throw _privateConstructorUsedError;
  BatteryStatus? get batteryStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecurityDataCopyWith<SecurityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityDataCopyWith<$Res> {
  factory $SecurityDataCopyWith(
          SecurityData value, $Res Function(SecurityData) then) =
      _$SecurityDataCopyWithImpl<$Res>;
  $Res call(
      {SosStatus? sosStatus,
      ElectricityStatus? electricityStatus,
      BatteryStatus? batteryStatus});
}

/// @nodoc
class _$SecurityDataCopyWithImpl<$Res> implements $SecurityDataCopyWith<$Res> {
  _$SecurityDataCopyWithImpl(this._value, this._then);

  final SecurityData _value;
  // ignore: unused_field
  final $Res Function(SecurityData) _then;

  @override
  $Res call({
    Object? sosStatus = freezed,
    Object? electricityStatus = freezed,
    Object? batteryStatus = freezed,
  }) {
    return _then(_value.copyWith(
      sosStatus: sosStatus == freezed
          ? _value.sosStatus
          : sosStatus // ignore: cast_nullable_to_non_nullable
              as SosStatus?,
      electricityStatus: electricityStatus == freezed
          ? _value.electricityStatus
          : electricityStatus // ignore: cast_nullable_to_non_nullable
              as ElectricityStatus?,
      batteryStatus: batteryStatus == freezed
          ? _value.batteryStatus
          : batteryStatus // ignore: cast_nullable_to_non_nullable
              as BatteryStatus?,
    ));
  }
}

/// @nodoc
abstract class _$$_SecurityDataCopyWith<$Res>
    implements $SecurityDataCopyWith<$Res> {
  factory _$$_SecurityDataCopyWith(
          _$_SecurityData value, $Res Function(_$_SecurityData) then) =
      __$$_SecurityDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {SosStatus? sosStatus,
      ElectricityStatus? electricityStatus,
      BatteryStatus? batteryStatus});
}

/// @nodoc
class __$$_SecurityDataCopyWithImpl<$Res>
    extends _$SecurityDataCopyWithImpl<$Res>
    implements _$$_SecurityDataCopyWith<$Res> {
  __$$_SecurityDataCopyWithImpl(
      _$_SecurityData _value, $Res Function(_$_SecurityData) _then)
      : super(_value, (v) => _then(v as _$_SecurityData));

  @override
  _$_SecurityData get _value => super._value as _$_SecurityData;

  @override
  $Res call({
    Object? sosStatus = freezed,
    Object? electricityStatus = freezed,
    Object? batteryStatus = freezed,
  }) {
    return _then(_$_SecurityData(
      sosStatus == freezed
          ? _value.sosStatus
          : sosStatus // ignore: cast_nullable_to_non_nullable
              as SosStatus?,
      electricityStatus == freezed
          ? _value.electricityStatus
          : electricityStatus // ignore: cast_nullable_to_non_nullable
              as ElectricityStatus?,
      batteryStatus == freezed
          ? _value.batteryStatus
          : batteryStatus // ignore: cast_nullable_to_non_nullable
              as BatteryStatus?,
    ));
  }
}

/// @nodoc

class _$_SecurityData implements _SecurityData {
  _$_SecurityData(this.sosStatus, this.electricityStatus, this.batteryStatus);

  @override
  final SosStatus? sosStatus;
  @override
  final ElectricityStatus? electricityStatus;
  @override
  final BatteryStatus? batteryStatus;

  @override
  String toString() {
    return 'SecurityData(sosStatus: $sosStatus, electricityStatus: $electricityStatus, batteryStatus: $batteryStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecurityData &&
            const DeepCollectionEquality().equals(other.sosStatus, sosStatus) &&
            const DeepCollectionEquality()
                .equals(other.electricityStatus, electricityStatus) &&
            const DeepCollectionEquality()
                .equals(other.batteryStatus, batteryStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sosStatus),
      const DeepCollectionEquality().hash(electricityStatus),
      const DeepCollectionEquality().hash(batteryStatus));

  @JsonKey(ignore: true)
  @override
  _$$_SecurityDataCopyWith<_$_SecurityData> get copyWith =>
      __$$_SecurityDataCopyWithImpl<_$_SecurityData>(this, _$identity);
}

abstract class _SecurityData implements SecurityData {
  factory _SecurityData(
      final SosStatus? sosStatus,
      final ElectricityStatus? electricityStatus,
      final BatteryStatus? batteryStatus) = _$_SecurityData;

  @override
  SosStatus? get sosStatus;
  @override
  ElectricityStatus? get electricityStatus;
  @override
  BatteryStatus? get batteryStatus;
  @override
  @JsonKey(ignore: true)
  _$$_SecurityDataCopyWith<_$_SecurityData> get copyWith =>
      throw _privateConstructorUsedError;
}

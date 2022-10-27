// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'security_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecurityObject _$SecurityObjectFromJson(Map<String, dynamic> json) {
  return _SecurityObject.fromJson(json);
}

/// @nodoc
mixin _$SecurityObject {
  @JsonKey(name: 'number')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  List<SecuritySection>? get sections => throw _privateConstructorUsedError;
  SosStatus? get sosStatus => throw _privateConstructorUsedError;
  ElectricityStatus? get electricityStatus =>
      throw _privateConstructorUsedError;
  BatteryStatus? get batteryStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityObjectCopyWith<SecurityObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityObjectCopyWith<$Res> {
  factory $SecurityObjectCopyWith(
          SecurityObject value, $Res Function(SecurityObject) then) =
      _$SecurityObjectCopyWithImpl<$Res, SecurityObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'number') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'address') String? address,
      List<SecuritySection>? sections,
      SosStatus? sosStatus,
      ElectricityStatus? electricityStatus,
      BatteryStatus? batteryStatus});
}

/// @nodoc
class _$SecurityObjectCopyWithImpl<$Res, $Val extends SecurityObject>
    implements $SecurityObjectCopyWith<$Res> {
  _$SecurityObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? sections = freezed,
    Object? sosStatus = freezed,
    Object? electricityStatus = freezed,
    Object? batteryStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      sections: freezed == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SecuritySection>?,
      sosStatus: freezed == sosStatus
          ? _value.sosStatus
          : sosStatus // ignore: cast_nullable_to_non_nullable
              as SosStatus?,
      electricityStatus: freezed == electricityStatus
          ? _value.electricityStatus
          : electricityStatus // ignore: cast_nullable_to_non_nullable
              as ElectricityStatus?,
      batteryStatus: freezed == batteryStatus
          ? _value.batteryStatus
          : batteryStatus // ignore: cast_nullable_to_non_nullable
              as BatteryStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecurityObjectCopyWith<$Res>
    implements $SecurityObjectCopyWith<$Res> {
  factory _$$_SecurityObjectCopyWith(
          _$_SecurityObject value, $Res Function(_$_SecurityObject) then) =
      __$$_SecurityObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'number') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'address') String? address,
      List<SecuritySection>? sections,
      SosStatus? sosStatus,
      ElectricityStatus? electricityStatus,
      BatteryStatus? batteryStatus});
}

/// @nodoc
class __$$_SecurityObjectCopyWithImpl<$Res>
    extends _$SecurityObjectCopyWithImpl<$Res, _$_SecurityObject>
    implements _$$_SecurityObjectCopyWith<$Res> {
  __$$_SecurityObjectCopyWithImpl(
      _$_SecurityObject _value, $Res Function(_$_SecurityObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? sections = freezed,
    Object? sosStatus = freezed,
    Object? electricityStatus = freezed,
    Object? batteryStatus = freezed,
  }) {
    return _then(_$_SecurityObject(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SecuritySection>?,
      freezed == sosStatus
          ? _value.sosStatus
          : sosStatus // ignore: cast_nullable_to_non_nullable
              as SosStatus?,
      freezed == electricityStatus
          ? _value.electricityStatus
          : electricityStatus // ignore: cast_nullable_to_non_nullable
              as ElectricityStatus?,
      freezed == batteryStatus
          ? _value.batteryStatus
          : batteryStatus // ignore: cast_nullable_to_non_nullable
              as BatteryStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecurityObject extends _SecurityObject {
  _$_SecurityObject(
      @JsonKey(name: 'number') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'address') this.address,
      final List<SecuritySection>? sections,
      this.sosStatus,
      this.electricityStatus,
      this.batteryStatus)
      : _sections = sections,
        super._();

  factory _$_SecurityObject.fromJson(Map<String, dynamic> json) =>
      _$$_SecurityObjectFromJson(json);

  @override
  @JsonKey(name: 'number')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'address')
  final String? address;
  final List<SecuritySection>? _sections;
  @override
  List<SecuritySection>? get sections {
    final value = _sections;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SosStatus? sosStatus;
  @override
  final ElectricityStatus? electricityStatus;
  @override
  final BatteryStatus? batteryStatus;

  @override
  String toString() {
    return 'SecurityObject(id: $id, name: $name, address: $address, sections: $sections, sosStatus: $sosStatus, electricityStatus: $electricityStatus, batteryStatus: $batteryStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecurityObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.sosStatus, sosStatus) ||
                other.sosStatus == sosStatus) &&
            (identical(other.electricityStatus, electricityStatus) ||
                other.electricityStatus == electricityStatus) &&
            (identical(other.batteryStatus, batteryStatus) ||
                other.batteryStatus == batteryStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      const DeepCollectionEquality().hash(_sections),
      sosStatus,
      electricityStatus,
      batteryStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecurityObjectCopyWith<_$_SecurityObject> get copyWith =>
      __$$_SecurityObjectCopyWithImpl<_$_SecurityObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecurityObjectToJson(
      this,
    );
  }
}

abstract class _SecurityObject extends SecurityObject {
  factory _SecurityObject(
      @JsonKey(name: 'number') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'address') final String? address,
      final List<SecuritySection>? sections,
      final SosStatus? sosStatus,
      final ElectricityStatus? electricityStatus,
      final BatteryStatus? batteryStatus) = _$_SecurityObject;
  _SecurityObject._() : super._();

  factory _SecurityObject.fromJson(Map<String, dynamic> json) =
      _$_SecurityObject.fromJson;

  @override
  @JsonKey(name: 'number')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  List<SecuritySection>? get sections;
  @override
  SosStatus? get sosStatus;
  @override
  ElectricityStatus? get electricityStatus;
  @override
  BatteryStatus? get batteryStatus;
  @override
  @JsonKey(ignore: true)
  _$$_SecurityObjectCopyWith<_$_SecurityObject> get copyWith =>
      throw _privateConstructorUsedError;
}

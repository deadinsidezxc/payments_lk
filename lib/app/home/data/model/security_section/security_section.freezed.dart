// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'security_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecuritySection _$SecuritySectionFromJson(Map<String, dynamic> json) {
  return _SecuritySection.fromJson(json);
}

/// @nodoc
mixin _$SecuritySection {
  @JsonKey(name: 'number')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  SecuritySectionStatus? get securityStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecuritySectionCopyWith<SecuritySection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecuritySectionCopyWith<$Res> {
  factory $SecuritySectionCopyWith(
          SecuritySection value, $Res Function(SecuritySection) then) =
      _$SecuritySectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'number') int? id,
      @JsonKey(name: 'status') SecuritySectionStatus? securityStatus,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$SecuritySectionCopyWithImpl<$Res>
    implements $SecuritySectionCopyWith<$Res> {
  _$SecuritySectionCopyWithImpl(this._value, this._then);

  final SecuritySection _value;
  // ignore: unused_field
  final $Res Function(SecuritySection) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? securityStatus = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      securityStatus: securityStatus == freezed
          ? _value.securityStatus
          : securityStatus // ignore: cast_nullable_to_non_nullable
              as SecuritySectionStatus?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SecuritySectionCopyWith<$Res>
    implements $SecuritySectionCopyWith<$Res> {
  factory _$$_SecuritySectionCopyWith(
          _$_SecuritySection value, $Res Function(_$_SecuritySection) then) =
      __$$_SecuritySectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'number') int? id,
      @JsonKey(name: 'status') SecuritySectionStatus? securityStatus,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$_SecuritySectionCopyWithImpl<$Res>
    extends _$SecuritySectionCopyWithImpl<$Res>
    implements _$$_SecuritySectionCopyWith<$Res> {
  __$$_SecuritySectionCopyWithImpl(
      _$_SecuritySection _value, $Res Function(_$_SecuritySection) _then)
      : super(_value, (v) => _then(v as _$_SecuritySection));

  @override
  _$_SecuritySection get _value => super._value as _$_SecuritySection;

  @override
  $Res call({
    Object? id = freezed,
    Object? securityStatus = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_SecuritySection(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      securityStatus == freezed
          ? _value.securityStatus
          : securityStatus // ignore: cast_nullable_to_non_nullable
              as SecuritySectionStatus?,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecuritySection implements _SecuritySection {
  const _$_SecuritySection(
      @JsonKey(name: 'number') this.id,
      @JsonKey(name: 'status') this.securityStatus,
      @JsonKey(name: 'name') this.name);

  factory _$_SecuritySection.fromJson(Map<String, dynamic> json) =>
      _$$_SecuritySectionFromJson(json);

  @override
  @JsonKey(name: 'number')
  final int? id;
  @override
  @JsonKey(name: 'status')
  final SecuritySectionStatus? securityStatus;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'SecuritySection(id: $id, securityStatus: $securityStatus, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecuritySection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.securityStatus, securityStatus) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(securityStatus),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_SecuritySectionCopyWith<_$_SecuritySection> get copyWith =>
      __$$_SecuritySectionCopyWithImpl<_$_SecuritySection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecuritySectionToJson(
      this,
    );
  }
}

abstract class _SecuritySection implements SecuritySection {
  const factory _SecuritySection(
      @JsonKey(name: 'number') final int? id,
      @JsonKey(name: 'status') final SecuritySectionStatus? securityStatus,
      @JsonKey(name: 'name') final String? name) = _$_SecuritySection;

  factory _SecuritySection.fromJson(Map<String, dynamic> json) =
      _$_SecuritySection.fromJson;

  @override
  @JsonKey(name: 'number')
  int? get id;
  @override
  @JsonKey(name: 'status')
  SecuritySectionStatus? get securityStatus;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_SecuritySectionCopyWith<_$_SecuritySection> get copyWith =>
      throw _privateConstructorUsedError;
}

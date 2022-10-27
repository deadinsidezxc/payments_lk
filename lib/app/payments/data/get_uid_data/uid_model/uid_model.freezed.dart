// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'uid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUidModel _$GetUidModelFromJson(Map<String, dynamic> json) {
  return _GetUidModel.fromJson(json);
}

/// @nodoc
mixin _$GetUidModel {
  @JsonKey(name: 'client')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'guid')
  String? get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUidModelCopyWith<GetUidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUidModelCopyWith<$Res> {
  factory $GetUidModelCopyWith(
          GetUidModel value, $Res Function(GetUidModel) then) =
      _$GetUidModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'client') String? clientName,
      @JsonKey(name: 'guid') String? uid});
}

/// @nodoc
class _$GetUidModelCopyWithImpl<$Res> implements $GetUidModelCopyWith<$Res> {
  _$GetUidModelCopyWithImpl(this._value, this._then);

  final GetUidModel _value;
  // ignore: unused_field
  final $Res Function(GetUidModel) _then;

  @override
  $Res call({
    Object? clientName = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GetUidModelCopyWith<$Res>
    implements $GetUidModelCopyWith<$Res> {
  factory _$$_GetUidModelCopyWith(
          _$_GetUidModel value, $Res Function(_$_GetUidModel) then) =
      __$$_GetUidModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'client') String? clientName,
      @JsonKey(name: 'guid') String? uid});
}

/// @nodoc
class __$$_GetUidModelCopyWithImpl<$Res> extends _$GetUidModelCopyWithImpl<$Res>
    implements _$$_GetUidModelCopyWith<$Res> {
  __$$_GetUidModelCopyWithImpl(
      _$_GetUidModel _value, $Res Function(_$_GetUidModel) _then)
      : super(_value, (v) => _then(v as _$_GetUidModel));

  @override
  _$_GetUidModel get _value => super._value as _$_GetUidModel;

  @override
  $Res call({
    Object? clientName = freezed,
    Object? uid = freezed,
  }) {
    return _then(_$_GetUidModel(
      clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetUidModel implements _GetUidModel {
  const _$_GetUidModel(@JsonKey(name: 'client') this.clientName,
      @JsonKey(name: 'guid') this.uid);

  factory _$_GetUidModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetUidModelFromJson(json);

  @override
  @JsonKey(name: 'client')
  final String? clientName;
  @override
  @JsonKey(name: 'guid')
  final String? uid;

  @override
  String toString() {
    return 'GetUidModel(clientName: $clientName, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUidModel &&
            const DeepCollectionEquality()
                .equals(other.clientName, clientName) &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clientName),
      const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$$_GetUidModelCopyWith<_$_GetUidModel> get copyWith =>
      __$$_GetUidModelCopyWithImpl<_$_GetUidModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetUidModelToJson(
      this,
    );
  }
}

abstract class _GetUidModel implements GetUidModel {
  const factory _GetUidModel(@JsonKey(name: 'client') final String? clientName,
      @JsonKey(name: 'guid') final String? uid) = _$_GetUidModel;

  factory _GetUidModel.fromJson(Map<String, dynamic> json) =
      _$_GetUidModel.fromJson;

  @override
  @JsonKey(name: 'client')
  String? get clientName;
  @override
  @JsonKey(name: 'guid')
  String? get uid;
  @override
  @JsonKey(ignore: true)
  _$$_GetUidModelCopyWith<_$_GetUidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

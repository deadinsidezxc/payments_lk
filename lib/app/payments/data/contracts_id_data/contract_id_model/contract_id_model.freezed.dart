// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contract_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContractIDModel _$ContractIDModelFromJson(Map<String, dynamic> json) {
  return _ContractIDModel.fromJson(json);
}

/// @nodoc
mixin _$ContractIDModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String? get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'id1c')
  String? get id1c => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractIDModelCopyWith<ContractIDModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractIDModelCopyWith<$Res> {
  factory $ContractIDModelCopyWith(
          ContractIDModel value, $Res Function(ContractIDModel) then) =
      _$ContractIDModelCopyWithImpl<$Res, ContractIDModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'id1c') String? id1c});
}

/// @nodoc
class _$ContractIDModelCopyWithImpl<$Res, $Val extends ContractIDModel>
    implements $ContractIDModelCopyWith<$Res> {
  _$ContractIDModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? id1c = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      id1c: freezed == id1c
          ? _value.id1c
          : id1c // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContractIDModelCopyWith<$Res>
    implements $ContractIDModelCopyWith<$Res> {
  factory _$$_ContractIDModelCopyWith(
          _$_ContractIDModel value, $Res Function(_$_ContractIDModel) then) =
      __$$_ContractIDModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'id1c') String? id1c});
}

/// @nodoc
class __$$_ContractIDModelCopyWithImpl<$Res>
    extends _$ContractIDModelCopyWithImpl<$Res, _$_ContractIDModel>
    implements _$$_ContractIDModelCopyWith<$Res> {
  __$$_ContractIDModelCopyWithImpl(
      _$_ContractIDModel _value, $Res Function(_$_ContractIDModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? id1c = freezed,
  }) {
    return _then(_$_ContractIDModel(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == id1c
          ? _value.id1c
          : id1c // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContractIDModel implements _ContractIDModel {
  const _$_ContractIDModel(@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'number') this.number, @JsonKey(name: 'id1c') this.id1c);

  factory _$_ContractIDModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContractIDModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'number')
  final String? number;
  @override
  @JsonKey(name: 'id1c')
  final String? id1c;

  @override
  String toString() {
    return 'ContractIDModel(id: $id, number: $number, id1c: $id1c)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContractIDModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.id1c, id1c) || other.id1c == id1c));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, id1c);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractIDModelCopyWith<_$_ContractIDModel> get copyWith =>
      __$$_ContractIDModelCopyWithImpl<_$_ContractIDModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractIDModelToJson(
      this,
    );
  }
}

abstract class _ContractIDModel implements ContractIDModel {
  const factory _ContractIDModel(
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'number') final String? number,
      @JsonKey(name: 'id1c') final String? id1c) = _$_ContractIDModel;

  factory _ContractIDModel.fromJson(Map<String, dynamic> json) =
      _$_ContractIDModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'number')
  String? get number;
  @override
  @JsonKey(name: 'id1c')
  String? get id1c;
  @override
  @JsonKey(ignore: true)
  _$$_ContractIDModelCopyWith<_$_ContractIDModel> get copyWith =>
      throw _privateConstructorUsedError;
}

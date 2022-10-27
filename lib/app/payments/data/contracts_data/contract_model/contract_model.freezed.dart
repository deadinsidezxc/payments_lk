// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContractModel _$ContractModelFromJson(Map<String, dynamic> json) {
  return _ContractModel.fromJson(json);
}

/// @nodoc
mixin _$ContractModel {
  @JsonKey(name: 'ContractNumber')
  String? get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractDate')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeContract')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractSumm')
  int? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'nameOrganization')
  String? get organization => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubscriptionFee')
  int? get fee => throw _privateConstructorUsedError;
  @JsonKey(name: 'Autopay')
  bool get autopay => throw _privateConstructorUsedError;
  @JsonKey(name: 'ObjectProtection')
  List<Objects> get address => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractModelCopyWith<ContractModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractModelCopyWith<$Res> {
  factory $ContractModelCopyWith(
          ContractModel value, $Res Function(ContractModel) then) =
      _$ContractModelCopyWithImpl<$Res, ContractModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ContractNumber') String? number,
      @JsonKey(name: 'ContractDate') String? date,
      @JsonKey(name: 'typeContract') String? type,
      @JsonKey(name: 'ContractSumm') int? balance,
      @JsonKey(name: 'isActive') bool isActive,
      @JsonKey(name: 'nameOrganization') String? organization,
      @JsonKey(name: 'SubscriptionFee') int? fee,
      @JsonKey(name: 'Autopay') bool autopay,
      @JsonKey(name: 'ObjectProtection') List<Objects> address,
      String? id});
}

/// @nodoc
class _$ContractModelCopyWithImpl<$Res, $Val extends ContractModel>
    implements $ContractModelCopyWith<$Res> {
  _$ContractModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? balance = freezed,
    Object? isActive = null,
    Object? organization = freezed,
    Object? fee = freezed,
    Object? autopay = null,
    Object? address = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      autopay: null == autopay
          ? _value.autopay
          : autopay // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Objects>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContractModelCopyWith<$Res>
    implements $ContractModelCopyWith<$Res> {
  factory _$$_ContractModelCopyWith(
          _$_ContractModel value, $Res Function(_$_ContractModel) then) =
      __$$_ContractModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ContractNumber') String? number,
      @JsonKey(name: 'ContractDate') String? date,
      @JsonKey(name: 'typeContract') String? type,
      @JsonKey(name: 'ContractSumm') int? balance,
      @JsonKey(name: 'isActive') bool isActive,
      @JsonKey(name: 'nameOrganization') String? organization,
      @JsonKey(name: 'SubscriptionFee') int? fee,
      @JsonKey(name: 'Autopay') bool autopay,
      @JsonKey(name: 'ObjectProtection') List<Objects> address,
      String? id});
}

/// @nodoc
class __$$_ContractModelCopyWithImpl<$Res>
    extends _$ContractModelCopyWithImpl<$Res, _$_ContractModel>
    implements _$$_ContractModelCopyWith<$Res> {
  __$$_ContractModelCopyWithImpl(
      _$_ContractModel _value, $Res Function(_$_ContractModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? balance = freezed,
    Object? isActive = null,
    Object? organization = freezed,
    Object? fee = freezed,
    Object? autopay = null,
    Object? address = null,
    Object? id = freezed,
  }) {
    return _then(_$_ContractModel(
      freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      null == autopay
          ? _value.autopay
          : autopay // ignore: cast_nullable_to_non_nullable
              as bool,
      null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Objects>,
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContractModel implements _ContractModel {
  _$_ContractModel(
      @JsonKey(name: 'ContractNumber') this.number,
      @JsonKey(name: 'ContractDate') this.date,
      @JsonKey(name: 'typeContract') this.type,
      @JsonKey(name: 'ContractSumm') this.balance,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'nameOrganization') this.organization,
      @JsonKey(name: 'SubscriptionFee') this.fee,
      @JsonKey(name: 'Autopay') this.autopay,
      @JsonKey(name: 'ObjectProtection') final List<Objects> address,
      this.id)
      : _address = address;

  factory _$_ContractModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContractModelFromJson(json);

  @override
  @JsonKey(name: 'ContractNumber')
  final String? number;
  @override
  @JsonKey(name: 'ContractDate')
  final String? date;
  @override
  @JsonKey(name: 'typeContract')
  final String? type;
  @override
  @JsonKey(name: 'ContractSumm')
  final int? balance;
  @override
  @JsonKey(name: 'isActive')
  final bool isActive;
  @override
  @JsonKey(name: 'nameOrganization')
  final String? organization;
  @override
  @JsonKey(name: 'SubscriptionFee')
  final int? fee;
  @override
  @JsonKey(name: 'Autopay')
  final bool autopay;
  final List<Objects> _address;
  @override
  @JsonKey(name: 'ObjectProtection')
  List<Objects> get address {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  @override
  final String? id;

  @override
  String toString() {
    return 'ContractModel(number: $number, date: $date, type: $type, balance: $balance, isActive: $isActive, organization: $organization, fee: $fee, autopay: $autopay, address: $address, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContractModel &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.autopay, autopay) || other.autopay == autopay) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      date,
      type,
      balance,
      isActive,
      organization,
      fee,
      autopay,
      const DeepCollectionEquality().hash(_address),
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractModelCopyWith<_$_ContractModel> get copyWith =>
      __$$_ContractModelCopyWithImpl<_$_ContractModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractModelToJson(
      this,
    );
  }
}

abstract class _ContractModel implements ContractModel {
  factory _ContractModel(
      @JsonKey(name: 'ContractNumber') final String? number,
      @JsonKey(name: 'ContractDate') final String? date,
      @JsonKey(name: 'typeContract') final String? type,
      @JsonKey(name: 'ContractSumm') final int? balance,
      @JsonKey(name: 'isActive') final bool isActive,
      @JsonKey(name: 'nameOrganization') final String? organization,
      @JsonKey(name: 'SubscriptionFee') final int? fee,
      @JsonKey(name: 'Autopay') final bool autopay,
      @JsonKey(name: 'ObjectProtection') final List<Objects> address,
      final String? id) = _$_ContractModel;

  factory _ContractModel.fromJson(Map<String, dynamic> json) =
      _$_ContractModel.fromJson;

  @override
  @JsonKey(name: 'ContractNumber')
  String? get number;
  @override
  @JsonKey(name: 'ContractDate')
  String? get date;
  @override
  @JsonKey(name: 'typeContract')
  String? get type;
  @override
  @JsonKey(name: 'ContractSumm')
  int? get balance;
  @override
  @JsonKey(name: 'isActive')
  bool get isActive;
  @override
  @JsonKey(name: 'nameOrganization')
  String? get organization;
  @override
  @JsonKey(name: 'SubscriptionFee')
  int? get fee;
  @override
  @JsonKey(name: 'Autopay')
  bool get autopay;
  @override
  @JsonKey(name: 'ObjectProtection')
  List<Objects> get address;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ContractModelCopyWith<_$_ContractModel> get copyWith =>
      throw _privateConstructorUsedError;
}

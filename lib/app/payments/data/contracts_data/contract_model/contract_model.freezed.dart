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
      _$ContractModelCopyWithImpl<$Res>;
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
class _$ContractModelCopyWithImpl<$Res>
    implements $ContractModelCopyWith<$Res> {
  _$ContractModelCopyWithImpl(this._value, this._then);

  final ContractModel _value;
  // ignore: unused_field
  final $Res Function(ContractModel) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? balance = freezed,
    Object? isActive = freezed,
    Object? organization = freezed,
    Object? fee = freezed,
    Object? autopay = freezed,
    Object? address = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organization: organization == freezed
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      autopay: autopay == freezed
          ? _value.autopay
          : autopay // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Objects>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ContractModelCopyWith<$Res>
    implements $ContractModelCopyWith<$Res> {
  factory _$$_ContractModelCopyWith(
          _$_ContractModel value, $Res Function(_$_ContractModel) then) =
      __$$_ContractModelCopyWithImpl<$Res>;
  @override
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
    extends _$ContractModelCopyWithImpl<$Res>
    implements _$$_ContractModelCopyWith<$Res> {
  __$$_ContractModelCopyWithImpl(
      _$_ContractModel _value, $Res Function(_$_ContractModel) _then)
      : super(_value, (v) => _then(v as _$_ContractModel));

  @override
  _$_ContractModel get _value => super._value as _$_ContractModel;

  @override
  $Res call({
    Object? number = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? balance = freezed,
    Object? isActive = freezed,
    Object? organization = freezed,
    Object? fee = freezed,
    Object? autopay = freezed,
    Object? address = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ContractModel(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organization == freezed
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      autopay == freezed
          ? _value.autopay
          : autopay // ignore: cast_nullable_to_non_nullable
              as bool,
      address == freezed
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Objects>,
      id == freezed
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
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality()
                .equals(other.organization, organization) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.autopay, autopay) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(organization),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(autopay),
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
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

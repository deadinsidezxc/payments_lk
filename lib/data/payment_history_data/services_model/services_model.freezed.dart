// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Services _$ServicesFromJson(Map<String, dynamic> json) {
  return _Services.fromJson(json);
}

/// @nodoc
mixin _$Services {
//@JsonKey(name: 'Name') String? name,
  @JsonKey(name: 'Count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'Price')
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'objectTitle')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'objectAddress')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractNumber')
  String? get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceType')
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesCopyWith<Services> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesCopyWith<$Res> {
  factory $ServicesCopyWith(Services value, $Res Function(Services) then) =
      _$ServicesCopyWithImpl<$Res, Services>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'Price') int? price,
      @JsonKey(name: 'objectTitle') String? name,
      @JsonKey(name: 'objectAddress') String? address,
      @JsonKey(name: 'contractNumber') String? number,
      @JsonKey(name: 'serviceType') String? type});
}

/// @nodoc
class _$ServicesCopyWithImpl<$Res, $Val extends Services>
    implements $ServicesCopyWith<$Res> {
  _$ServicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? price = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? number = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServicesCopyWith<$Res> implements $ServicesCopyWith<$Res> {
  factory _$$_ServicesCopyWith(
          _$_Services value, $Res Function(_$_Services) then) =
      __$$_ServicesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'Price') int? price,
      @JsonKey(name: 'objectTitle') String? name,
      @JsonKey(name: 'objectAddress') String? address,
      @JsonKey(name: 'contractNumber') String? number,
      @JsonKey(name: 'serviceType') String? type});
}

/// @nodoc
class __$$_ServicesCopyWithImpl<$Res>
    extends _$ServicesCopyWithImpl<$Res, _$_Services>
    implements _$$_ServicesCopyWith<$Res> {
  __$$_ServicesCopyWithImpl(
      _$_Services _value, $Res Function(_$_Services) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? price = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? number = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Services(
      freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Services implements _Services {
  _$_Services(
      @JsonKey(name: 'Count') this.count,
      @JsonKey(name: 'Price') this.price,
      @JsonKey(name: 'objectTitle') this.name,
      @JsonKey(name: 'objectAddress') this.address,
      @JsonKey(name: 'contractNumber') this.number,
      @JsonKey(name: 'serviceType') this.type);

  factory _$_Services.fromJson(Map<String, dynamic> json) =>
      _$$_ServicesFromJson(json);

//@JsonKey(name: 'Name') String? name,
  @override
  @JsonKey(name: 'Count')
  final int? count;
  @override
  @JsonKey(name: 'Price')
  final int? price;
  @override
  @JsonKey(name: 'objectTitle')
  final String? name;
  @override
  @JsonKey(name: 'objectAddress')
  final String? address;
  @override
  @JsonKey(name: 'contractNumber')
  final String? number;
  @override
  @JsonKey(name: 'serviceType')
  final String? type;

  @override
  String toString() {
    return 'Services(count: $count, price: $price, name: $name, address: $address, number: $number, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Services &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, count, price, name, address, number, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServicesCopyWith<_$_Services> get copyWith =>
      __$$_ServicesCopyWithImpl<_$_Services>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServicesToJson(
      this,
    );
  }
}

abstract class _Services implements Services {
  factory _Services(
      @JsonKey(name: 'Count') final int? count,
      @JsonKey(name: 'Price') final int? price,
      @JsonKey(name: 'objectTitle') final String? name,
      @JsonKey(name: 'objectAddress') final String? address,
      @JsonKey(name: 'contractNumber') final String? number,
      @JsonKey(name: 'serviceType') final String? type) = _$_Services;

  factory _Services.fromJson(Map<String, dynamic> json) = _$_Services.fromJson;

  @override //@JsonKey(name: 'Name') String? name,
  @JsonKey(name: 'Count')
  int? get count;
  @override
  @JsonKey(name: 'Price')
  int? get price;
  @override
  @JsonKey(name: 'objectTitle')
  String? get name;
  @override
  @JsonKey(name: 'objectAddress')
  String? get address;
  @override
  @JsonKey(name: 'contractNumber')
  String? get number;
  @override
  @JsonKey(name: 'serviceType')
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesCopyWith<_$_Services> get copyWith =>
      throw _privateConstructorUsedError;
}

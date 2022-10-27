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
      _$ServicesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'Price') int? price,
      @JsonKey(name: 'objectTitle') String? name,
      @JsonKey(name: 'objectAddress') String? address,
      @JsonKey(name: 'contractNumber') String? number,
      @JsonKey(name: 'serviceType') String? type});
}

/// @nodoc
class _$ServicesCopyWithImpl<$Res> implements $ServicesCopyWith<$Res> {
  _$ServicesCopyWithImpl(this._value, this._then);

  final Services _value;
  // ignore: unused_field
  final $Res Function(Services) _then;

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
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServicesCopyWith<$Res> implements $ServicesCopyWith<$Res> {
  factory _$$_ServicesCopyWith(
          _$_Services value, $Res Function(_$_Services) then) =
      __$$_ServicesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'Price') int? price,
      @JsonKey(name: 'objectTitle') String? name,
      @JsonKey(name: 'objectAddress') String? address,
      @JsonKey(name: 'contractNumber') String? number,
      @JsonKey(name: 'serviceType') String? type});
}

/// @nodoc
class __$$_ServicesCopyWithImpl<$Res> extends _$ServicesCopyWithImpl<$Res>
    implements _$$_ServicesCopyWith<$Res> {
  __$$_ServicesCopyWithImpl(
      _$_Services _value, $Res Function(_$_Services) _then)
      : super(_value, (v) => _then(v as _$_Services));

  @override
  _$_Services get _value => super._value as _$_Services;

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
      count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      type == freezed
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
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
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

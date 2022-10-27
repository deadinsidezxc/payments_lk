// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payments_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentsHistoryModel _$PaymentsHistoryModelFromJson(Map<String, dynamic> json) {
  return _PaymentsHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentsHistoryModel {
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_pay')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'summ')
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'services')
  List<Services> get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentsHistoryModelCopyWith<PaymentsHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentsHistoryModelCopyWith<$Res> {
  factory $PaymentsHistoryModelCopyWith(PaymentsHistoryModel value,
          $Res Function(PaymentsHistoryModel) then) =
      _$PaymentsHistoryModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'type_pay') String? type,
      @JsonKey(name: 'summ') int? price,
      @JsonKey(name: 'services') List<Services> services});
}

/// @nodoc
class _$PaymentsHistoryModelCopyWithImpl<$Res>
    implements $PaymentsHistoryModelCopyWith<$Res> {
  _$PaymentsHistoryModelCopyWithImpl(this._value, this._then);

  final PaymentsHistoryModel _value;
  // ignore: unused_field
  final $Res Function(PaymentsHistoryModel) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Services>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentsHistoryModelCopyWith<$Res>
    implements $PaymentsHistoryModelCopyWith<$Res> {
  factory _$$_PaymentsHistoryModelCopyWith(_$_PaymentsHistoryModel value,
          $Res Function(_$_PaymentsHistoryModel) then) =
      __$$_PaymentsHistoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'type_pay') String? type,
      @JsonKey(name: 'summ') int? price,
      @JsonKey(name: 'services') List<Services> services});
}

/// @nodoc
class __$$_PaymentsHistoryModelCopyWithImpl<$Res>
    extends _$PaymentsHistoryModelCopyWithImpl<$Res>
    implements _$$_PaymentsHistoryModelCopyWith<$Res> {
  __$$_PaymentsHistoryModelCopyWithImpl(_$_PaymentsHistoryModel _value,
      $Res Function(_$_PaymentsHistoryModel) _then)
      : super(_value, (v) => _then(v as _$_PaymentsHistoryModel));

  @override
  _$_PaymentsHistoryModel get _value => super._value as _$_PaymentsHistoryModel;

  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? services = freezed,
  }) {
    return _then(_$_PaymentsHistoryModel(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      services == freezed
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Services>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentsHistoryModel implements _PaymentsHistoryModel {
  _$_PaymentsHistoryModel(
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'type_pay') this.type,
      @JsonKey(name: 'summ') this.price,
      @JsonKey(name: 'services') final List<Services> services)
      : _services = services;

  factory _$_PaymentsHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentsHistoryModelFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'type_pay')
  final String? type;
  @override
  @JsonKey(name: 'summ')
  final int? price;
  final List<Services> _services;
  @override
  @JsonKey(name: 'services')
  List<Services> get services {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'PaymentsHistoryModel(date: $date, type: $type, price: $price, services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentsHistoryModel &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentsHistoryModelCopyWith<_$_PaymentsHistoryModel> get copyWith =>
      __$$_PaymentsHistoryModelCopyWithImpl<_$_PaymentsHistoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentsHistoryModelToJson(
      this,
    );
  }
}

abstract class _PaymentsHistoryModel implements PaymentsHistoryModel {
  factory _PaymentsHistoryModel(
          @JsonKey(name: 'date') final String? date,
          @JsonKey(name: 'type_pay') final String? type,
          @JsonKey(name: 'summ') final int? price,
          @JsonKey(name: 'services') final List<Services> services) =
      _$_PaymentsHistoryModel;

  factory _PaymentsHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_PaymentsHistoryModel.fromJson;

  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'type_pay')
  String? get type;
  @override
  @JsonKey(name: 'summ')
  int? get price;
  @override
  @JsonKey(name: 'services')
  List<Services> get services;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentsHistoryModelCopyWith<_$_PaymentsHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

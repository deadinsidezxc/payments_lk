// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentsHistoryModel _$$_PaymentsHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentsHistoryModel(
      json['date'] as String?,
      json['type_pay'] as String?,
      json['summ'] as int?,
      (json['services'] as List<dynamic>)
          .map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaymentsHistoryModelToJson(
        _$_PaymentsHistoryModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type_pay': instance.type,
      'summ': instance.price,
      'services': instance.services,
    };

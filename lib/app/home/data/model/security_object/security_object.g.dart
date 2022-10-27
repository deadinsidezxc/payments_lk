// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecurityObject _$$_SecurityObjectFromJson(Map<String, dynamic> json) =>
    _$_SecurityObject(
      json['number'] as int?,
      json['name'] as String?,
      json['address'] as String?,
      (json['sections'] as List<dynamic>?)
          ?.map((e) => SecuritySection.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecodeNullable(_$SosStatusEnumMap, json['sosStatus']),
      $enumDecodeNullable(
          _$ElectricityStatusEnumMap, json['electricityStatus']),
      $enumDecodeNullable(_$BatteryStatusEnumMap, json['batteryStatus']),
    );

Map<String, dynamic> _$$_SecurityObjectToJson(_$_SecurityObject instance) =>
    <String, dynamic>{
      'number': instance.id,
      'name': instance.name,
      'address': instance.address,
      'sections': instance.sections,
      'sosStatus': _$SosStatusEnumMap[instance.sosStatus],
      'electricityStatus':
          _$ElectricityStatusEnumMap[instance.electricityStatus],
      'batteryStatus': _$BatteryStatusEnumMap[instance.batteryStatus],
    };

const _$SosStatusEnumMap = {
  SosStatus.available: 1,
  SosStatus.notAvailable: 0,
};

const _$ElectricityStatusEnumMap = {
  ElectricityStatus.available: 1,
  ElectricityStatus.notAvailable: 0,
};

const _$BatteryStatusEnumMap = {
  BatteryStatus.full: 'full',
  BatteryStatus.low: 'low',
  BatteryStatus.empty: 'empty',
};

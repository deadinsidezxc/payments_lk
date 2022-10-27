// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Services _$$_ServicesFromJson(Map<String, dynamic> json) => _$_Services(
      json['Count'] as int?,
      json['Price'] as int?,
      json['objectTitle'] as String?,
      json['objectAddress'] as String?,
      json['contractNumber'] as String?,
      json['serviceType'] as String?,
    );

Map<String, dynamic> _$$_ServicesToJson(_$_Services instance) =>
    <String, dynamic>{
      'Count': instance.count,
      'Price': instance.price,
      'objectTitle': instance.name,
      'objectAddress': instance.address,
      'contractNumber': instance.number,
      'serviceType': instance.type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetUidModel _$$_GetUidModelFromJson(Map<String, dynamic> json) =>
    _$_GetUidModel(
      json['client'] as String?,
      json['guid'] as String?,
    );

Map<String, dynamic> _$$_GetUidModelToJson(_$_GetUidModel instance) =>
    <String, dynamic>{
      'client': instance.clientName,
      'guid': instance.uid,
    };

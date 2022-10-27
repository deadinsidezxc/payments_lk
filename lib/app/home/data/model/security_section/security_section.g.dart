// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecuritySection _$$_SecuritySectionFromJson(Map<String, dynamic> json) =>
    _$_SecuritySection(
      json['number'] as int?,
      $enumDecodeNullable(_$SecuritySectionStatusEnumMap, json['status']),
      json['name'] as String?,
    );

Map<String, dynamic> _$$_SecuritySectionToJson(_$_SecuritySection instance) =>
    <String, dynamic>{
      'number': instance.id,
      'status': _$SecuritySectionStatusEnumMap[instance.securityStatus],
      'name': instance.name,
    };

const _$SecuritySectionStatusEnumMap = {
  SecuritySectionStatus.undefined: 0,
  SecuritySectionStatus.notProtected: 1,
  SecuritySectionStatus.protected: 2,
  SecuritySectionStatus.incident: 3,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContractModel _$$_ContractModelFromJson(Map<String, dynamic> json) =>
    _$_ContractModel(
      json['ContractNumber'] as String?,
      json['ContractDate'] as String?,
      json['typeContract'] as String?,
      json['ContractSumm'] as int?,
      json['nameOrganization'] as String?,
      json['SubscriptionFee'] as int?,
      json['Autopay'] as bool,
      (json['ObjectProtection'] as List<dynamic>)
          .map((e) => Objects.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as String?,
    );

Map<String, dynamic> _$$_ContractModelToJson(_$_ContractModel instance) =>
    <String, dynamic>{
      'ContractNumber': instance.number,
      'ContractDate': instance.date,
      'typeContract': instance.type,
      'ContractSumm': instance.balance,
      'nameOrganization': instance.organization,
      'SubscriptionFee': instance.fee,
      'Autopay': instance.autopay,
      'ObjectProtection': instance.address,
      'id': instance.id,
    };

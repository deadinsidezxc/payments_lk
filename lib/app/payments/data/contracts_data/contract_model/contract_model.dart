import 'package:freezed_annotation/freezed_annotation.dart';

import 'object_model/object_model.dart';

part 'contract_model.freezed.dart';
part 'contract_model.g.dart';

@freezed
class ContractModel with _$ContractModel {
  factory ContractModel(
      @JsonKey(name: 'ContractNumber') String? number,
      @JsonKey(name: 'ContractDate') String? date,
      @JsonKey(name: 'typeContract') String? type,
      @JsonKey(name: 'ContractSumm') int? balance,
      //@JsonKey(name: 'ContractSummFull') int? price,
      @JsonKey(name: 'nameOrganization') String? organization,
      @JsonKey(name: 'SubscriptionFee') int? fee,
      @JsonKey(name: 'Autopay') bool autopay,
      @JsonKey(name: 'ObjectProtection') List<Objects> address,
      String? id
      ) = _ContractModel;

  factory ContractModel.fromJson(Map<String, Object?> json) =>
      _$ContractModelFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_id_model.freezed.dart';
part 'contract_id_model.g.dart';

@freezed
class ContractIDModel with _$ContractIDModel {
  const factory ContractIDModel(
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'id1c') String? id1c,
      ) = _ContractIDModel;

  factory ContractIDModel.fromJson(Map<String, Object?> json) =>
      _$ContractIDModelFromJson(json);
}
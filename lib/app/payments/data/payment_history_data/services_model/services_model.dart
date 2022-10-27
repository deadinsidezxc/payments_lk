import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_model.freezed.dart';
part 'services_model.g.dart';

@freezed
class Services with _$Services {
  factory Services(
      //@JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'Price') int? price,
      @JsonKey(name: 'objectTitle') String? name,
      @JsonKey(name: 'objectAddress') String? address,
      @JsonKey(name: 'contractNumber') String? number,
      @JsonKey(name: 'serviceType') String? type,

      ) = _Services;

  factory Services.fromJson(Map<String, Object?> json) =>
      _$ServicesFromJson(json);
}
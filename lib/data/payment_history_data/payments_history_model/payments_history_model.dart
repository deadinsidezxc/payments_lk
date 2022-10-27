import 'package:freezed_annotation/freezed_annotation.dart';

import '../services_model/services_model.dart';

part 'payments_history_model.freezed.dart';
part 'payments_history_model.g.dart';

@freezed
class PaymentsHistoryModel with _$PaymentsHistoryModel {
  factory PaymentsHistoryModel(
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'type_pay') String? type,
      @JsonKey(name: 'summ') int? price,
      @JsonKey(name: 'services') List<Services> services,
      ) = _PaymentsHistoryModel;

  factory PaymentsHistoryModel.fromJson(Map<String, Object?> json) =>
      _$PaymentsHistoryModelFromJson(json);
}
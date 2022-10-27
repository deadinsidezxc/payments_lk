import 'package:freezed_annotation/freezed_annotation.dart';

part 'uid_model.freezed.dart';
part 'uid_model.g.dart';

@freezed
class GetUidModel with _$GetUidModel {
  const factory GetUidModel(
      @JsonKey(name: 'client') String? clientName,
      @JsonKey(name: 'guid') String? uid,
      ) = _GetUidModel;

  factory GetUidModel.fromJson(Map<String, Object?> json) =>
      _$GetUidModelFromJson(json);
}
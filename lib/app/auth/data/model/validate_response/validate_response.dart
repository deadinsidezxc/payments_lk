// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_response.freezed.dart';
part 'validate_response.g.dart';

@freezed
class ValidateResponse with _$ValidateResponse {
  factory ValidateResponse(
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'full_name') String? fullName,
  ) = _ValidateResponse;

  factory ValidateResponse.fromJson(Map<String, Object?> json) =>
      _$ValidateResponseFromJson(json);
}

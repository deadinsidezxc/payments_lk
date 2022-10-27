import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_model.freezed.dart';
part 'object_model.g.dart';

@freezed
class Objects with _$Objects {
  factory Objects(
      @JsonKey(name: 'AdressObjectProtection') String? addressName,
      ) = _Objects;

  factory Objects.fromJson(Map<String, Object?> json) =>
      _$ObjectsFromJson(json);
}
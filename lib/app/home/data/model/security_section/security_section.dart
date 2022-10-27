// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reforce_platform/gen/assets.gen.dart';

part 'security_section.freezed.dart';
part 'security_section.g.dart';

@freezed
class SecuritySection with _$SecuritySection {
  const factory SecuritySection(
    @JsonKey(name: 'number') int? id,
    @JsonKey(name: 'status') SecuritySectionStatus? securityStatus,
    @JsonKey(name: 'name') String? name,
  ) = _SecuritySection;

  factory SecuritySection.fromJson(Map<String, Object?> json) =>
      _$SecuritySectionFromJson(json);
}

enum SecuritySectionStatus {
  @JsonValue(0)
  undefined,
  @JsonValue(1)
  notProtected,
  @JsonValue(2)
  protected,
  @JsonValue(3)
  incident,
}

extension SecuritySectionsSVG on SecuritySectionStatus {
  SvgGenImage get circleSVG {
    switch (this) {
      case SecuritySectionStatus.protected:
        return Assets.images.circleSecurityStatus.protected;
      case SecuritySectionStatus.incident:
        return Assets.images.circleSecurityStatus.incident;
      default:
        return Assets.images.circleSecurityStatus.notProtected;
    }
  }

  String get text {
    switch (this) {
      case SecuritySectionStatus.protected:
        return 'на защите';
      case SecuritySectionStatus.incident:
        return 'инцидент';
      default:
        return 'снят с защиты';
    }
  }
}

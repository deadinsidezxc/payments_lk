// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reforce_platform/app/home/data/model/security_section/security_section.dart';
import 'package:reforce_platform/gen/assets.gen.dart';

part 'security_object.freezed.dart';
part 'security_object.g.dart';

@freezed
class SecurityObject with _$SecurityObject {
  SecurityObject._();

  factory SecurityObject(
    @JsonKey(name: 'number') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
    List<SecuritySection>? sections,
    SosStatus? sosStatus,
    ElectricityStatus? electricityStatus,
    BatteryStatus? batteryStatus,
  ) = _SecurityObject;

  factory SecurityObject.fromJson(Map<String, Object?> json) =>
      _$SecurityObjectFromJson(json);

  late final SecurityObjectStatus securityStatus = _calculateSecurityStatus;

  SecurityObjectStatus get _calculateSecurityStatus {
    final statuses = (sections ?? []).map((e) => e.securityStatus);

    final protected = statuses.contains(SecuritySectionStatus.protected);
    final notProtected = statuses.contains(SecuritySectionStatus.notProtected);
    final incident = statuses.contains(SecuritySectionStatus.incident);

    if (incident) {
      return SecurityObjectStatus.incident;
    } else if (protected && !notProtected) {
      return SecurityObjectStatus.protected;
    } else if (!protected && notProtected) {
      return SecurityObjectStatus.notProtected;
    } else if (protected && notProtected) {
      return SecurityObjectStatus.partially;
    }
    return SecurityObjectStatus.undefined;
  }
}

enum SosStatus {
  @JsonValue(1)
  available,
  @JsonValue(0)
  notAvailable,
}

enum SecurityObjectStatus {
  undefined,
  protected,
  partially,
  notProtected,
  incident,
}

enum BatteryStatus {
  full,
  low,
  empty,
}

enum ElectricityStatus {
  @JsonValue(1)
  available,
  @JsonValue(0)
  notAvailable,
}

extension SecurityStatusSVG on SecurityObjectStatus {
  SvgGenImage get genSVG {
    switch (this) {
      case SecurityObjectStatus.protected:
        return Assets.images.securityStatus.protected;
      case SecurityObjectStatus.partially:
        return Assets.images.securityStatus.partially;
      case SecurityObjectStatus.notProtected:
        return Assets.images.securityStatus.notProtected;
      case SecurityObjectStatus.incident:
        return Assets.images.securityStatus.incident;
      case SecurityObjectStatus.undefined:
        return Assets.images.securityStatus.undefined;
    }
  }

  SvgGenImage get genCircleSVG {
    switch (this) {
      case SecurityObjectStatus.protected:
        return Assets.images.circleSecurityStatus.protected;
      case SecurityObjectStatus.partially:
        return Assets.images.circleSecurityStatus.partially;
      case SecurityObjectStatus.notProtected:
        return Assets.images.circleSecurityStatus.notProtected;
      case SecurityObjectStatus.incident:
        return Assets.images.circleSecurityStatus.incident;
      case SecurityObjectStatus.undefined:
        return Assets.images.circleSecurityStatus.undefined;
    }
  }

  String get text {
    switch (this) {
      case SecurityObjectStatus.protected:
        return 'под защитой';
      case SecurityObjectStatus.partially:
        return 'частичная защита';
      case SecurityObjectStatus.notProtected:
        return 'снят с защиты';
      case SecurityObjectStatus.incident:
        return 'работа с инцидентом';
      case SecurityObjectStatus.undefined:
        return 'неизвестно';
    }
  }
}

extension SosStatusSVG on SosStatus {
  SvgGenImage get genSVG {
    switch (this) {
      case SosStatus.available:
        return Assets.images.sosButton.available;
      case SosStatus.notAvailable:
        return Assets.images.sosButton.notAvailable;
    }
  }
}

extension BatteryStatusSVG on BatteryStatus {
  SvgGenImage get genSVG {
    switch (this) {
      case BatteryStatus.full:
        return Assets.images.battery.full;
      case BatteryStatus.empty:
        return Assets.images.battery.empty;
      case BatteryStatus.low:
        return Assets.images.battery.low;
    }
  }

  String get text {
    switch (this) {
      case BatteryStatus.full:
        return 'батарея\nзаряжена';
      case BatteryStatus.low:
        return 'батарея\nпочти разряжена';
      case BatteryStatus.empty:
        return 'батарея\nразряжена';
    }
  }
}

extension ElectricityStatusSVG on ElectricityStatus {
  SvgGenImage get genSVG {
    switch (this) {
      case ElectricityStatus.available:
        return Assets.images.electricity.available;
      case ElectricityStatus.notAvailable:
        return Assets.images.electricity.notAvailable;
    }
  }

  String get text {
    switch (this) {
      case ElectricityStatus.available:
        return 'сеть вкл';
      case ElectricityStatus.notAvailable:
        return 'сеть выкл';
    }
  }
}

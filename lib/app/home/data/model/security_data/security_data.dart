import 'package:freezed_annotation/freezed_annotation.dart';

import '../security_object/security_object.dart';

part 'security_data.freezed.dart';

@freezed
class SecurityData with _$SecurityData {
  factory SecurityData(
    SosStatus? sosStatus,
    ElectricityStatus? electricityStatus,
    BatteryStatus? batteryStatus,
  ) = _SecurityData;

  factory SecurityData.fromJson(Map<String, Object?> json) {
    final statuses = json['statuses'] as Map<String, dynamic>;
    BatteryStatus batteryStatus = statuses['is_low_battery'] == 1
        ? BatteryStatus.low
        : BatteryStatus.full;
    if (statuses['is_no_battery'] == 1) {
      batteryStatus = BatteryStatus.empty;
    }
    return SecurityData(
        json['have_mkts'] == 1 ? SosStatus.available : SosStatus.notAvailable,
        statuses['is_mains'] == 1
            ? ElectricityStatus.available
            : ElectricityStatus.notAvailable,
        batteryStatus);
  }
}

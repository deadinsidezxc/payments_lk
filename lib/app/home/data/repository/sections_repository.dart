import 'package:reforce_platform/app/home/data/ds/sections_ds.dart';
import 'package:reforce_platform/common/widgets/bottom_pincode_sheet.dart';

class SectionsRepository implements ISectionsRepository {
  @override
  Future<void> setSectionsStatus(
      {required int objectId,
      required List<int> sectionIds,
      required String pincode,
      required ProtectionStatus status}) async {
    final ds = SectionsDS();
    if (status == ProtectionStatus.enable) {
      await ds.enableSections(
          objectId: objectId, sectionIds: sectionIds, pincode: pincode);
    } else if (status == ProtectionStatus.disable) {
      await ds.disableSections(
          objectId: objectId, sectionIds: sectionIds, pincode: pincode);
    }
  }
}

abstract class ISectionsRepository {
  Future<void> setSectionsStatus(
      {required int objectId,
      required List<int> sectionIds,
      required String pincode,
      required ProtectionStatus status});
}

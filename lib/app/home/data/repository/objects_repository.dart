import 'package:reforce_platform/app/home/data/model/security_data/security_data.dart';
import 'package:reforce_platform/app/home/data/model/security_section/security_section.dart';

import '../ds/objects_ds.dart';
import '../model/security_object/security_object.dart';

class ListSecurityObjectsRepository implements IListSecurityObjectsRepository {
  final _apiDS = SecurityObjectsDS();

  @override
  Future<List<SecurityObject>> fetchObjects() async {
    final objects = await _apiDS
        .fetchObjects()
        .catchError((e) => Future.value(<Map<String, dynamic>>[]))
        .then((value) => value.map(SecurityObject.fromJson));

    final data = await Future.wait(objects.map((e) => _apiDS
        .fetchObjectData(id: e.id ?? 0)
        .catchError((e) => Future.value(<String, dynamic>{}))
        .then((SecurityData.fromJson))));

    final sections = await Future.wait(objects.map((e) => _apiDS
        .fetchObjectSections(id: e.id ?? 0)
        .catchError((e) => Future.value(<Map<String, dynamic>>[]))
        .then((e) => e.map(SecuritySection.fromJson))));

    return objects
        .toList()
        .asMap()
        .entries
        .map((e) => e.value.copyWith(
            sections: sections[e.key].toList(),
            sosStatus: data[e.key].sosStatus,
            batteryStatus: data[e.key].batteryStatus,
            electricityStatus: data[e.key].electricityStatus))
        .toList();
  }

  @override
  Future<void> callGBR({required int objectId}) async {
    await _apiDS.callGBR(objectId: objectId);
  }
}

abstract class IListSecurityObjectsRepository {
  Future<List<SecurityObject>> fetchObjects();
  Future<void> callGBR({required int objectId});
}

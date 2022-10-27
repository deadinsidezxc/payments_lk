import 'package:dio/dio.dart';
import '../../../../common/network.dart';

class SectionsDS implements ISectionsDS {
  final _dio = Dio(baseOptionsV3);

  @override
  Future<Map<String, dynamic>> disableSections(
      {required int objectId,
      required List<int> sectionIds,
      required String pincode}) async {
    final response = await _dio.post('armor/off/$objectId',
        data: {'pincode': pincode, 'sections': sectionIds});
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> enableSections(
      {required int objectId,
      required List<int> sectionIds,
      required String pincode}) async {
    final response = await _dio.post('armor/on/$objectId',
        data: {'pincode': pincode, 'sections': sectionIds});
    return response.data as Map<String, dynamic>;
  }
}

abstract class ISectionsDS {
  Future<Map<String, dynamic>> enableSections(
      {required int objectId,
      required List<int> sectionIds,
      required String pincode});
  Future<Map<String, dynamic>> disableSections(
      {required int objectId,
      required List<int> sectionIds,
      required String pincode});
}

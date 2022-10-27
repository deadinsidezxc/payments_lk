import 'package:dio/dio.dart';
import 'package:reforce_platform/common/network.dart';

class SecurityObjectsDS implements ISecurityObjectDS {
  final _dio = Dio(baseOptionsV3);

  @override
  Future<List<Map<String, dynamic>>> fetchObjects() async {
    try {
      final response = await _dio.get('objects/full/');
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
        return List<Map<String, dynamic>>.from(jsonMap['objects']);
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> fetchObjectData({required int id}) async {
    try {
      final response = await _dio.get('object/$id');
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
        return jsonMap;
      }
      throw Error();
    } catch (e) {
      return <String, dynamic>{};
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchObjectSections(
      {required int id}) async {
    try {
      final response = await _dio.get('sections/$id');
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
        return List<Map<String, dynamic>>.from((jsonMap['sections']));
      }
      throw Error;
    } catch (e) {
      return <Map<String, dynamic>>[];
    }
  }

  @override
  Future<void> callGBR({required int objectId}) async {
    try {
      await _dio.post('mkts/$objectId', data: {});
    } catch (e) {
      rethrow;
    }
  }
}

abstract class ISecurityObjectDS {
  Future<List<Map<String, dynamic>>> fetchObjects();
  Future<Map<String, dynamic>> fetchObjectData({required int id});
  Future<List<Map<String, dynamic>>> fetchObjectSections({required int id});
  Future<void> callGBR({required int objectId});
}

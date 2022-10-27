import 'package:dio/dio.dart';

import '../../../core/dictionaries/dio_configurations.dart';

class GetUidDS {
  final _dioV3 = Dio(baseOptionsV3);

  Future<List<Map<String, dynamic>>> getUid() async {
    try {
      final response = await _dioV3.get('contracts/by_phone/9525115416');
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
        return List<Map<String, dynamic>>.from(jsonMap['result']);
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
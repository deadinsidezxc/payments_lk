import 'package:dio/dio.dart';
import '../../../../common/network.dart';

class OldAuthDS implements IAuthDS {
  final _dio = Dio(baseOptionsV2);

  @override
  Future<bool> sendSMS({required String phone}) async {
    try {
      final response = await _dio.post('sendSms/$phone');
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 404) {
        throw NotFoundException();
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  @override
  Future<Map<String, dynamic>> validatePincode(
      {required String phone, required String pincode}) async {
    try {
      final response = await _dio
          .post('validate/$phone', data: {'phone': phone, 'smscode': pincode});
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
      } else if (jsonMap['success'] == false) {
        throw NotCorrectException();
      }
    } catch (e) {
      rethrow;
    }
    return {};
  }
}

abstract class IAuthDS {
  Future<bool> sendSMS({required String phone});
  Future<Map<String, dynamic>> validatePincode(
      {required String phone, required String pincode});
}

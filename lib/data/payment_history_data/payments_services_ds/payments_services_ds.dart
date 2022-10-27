import 'package:dio/dio.dart';

import '../../../core/dictionaries/dio_configurations.dart';

class PaymentsHistoryDS {
  final _dioV2 = Dio(baseOptionsV2);

  Future<List<Map<String, dynamic>>> getPaymentsHistory(String id) async {

    try {
      final response = await _dioV2.post('getPayHistory',
          data: {
            "contract_id": id,
            "offset": 0,
            "limit": 20
          });
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
        return List<Map<String, dynamic>>.from(jsonMap['pay_history']);
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
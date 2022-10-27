import 'package:dio/dio.dart';

import '../../core/dictionaries/dio_configurations.dart';
import '../get_uid_data/repository/uid_repo.dart';

class PaymentsDS {
  final _dioV3 = Dio(baseOptionsV3);
  //final _dioV2 = Dio(baseOptionsV2);

  Future<String> createPayment(String contractId, double price) async {
    final repository = ListUidRepository();
    final cuidData = await repository.fetchUid();
    final cuid = cuidData.first.uid ?? '';
    try {
      final response = await _dioV3.post('payments/$cuid', data: {
        "phone": "9525115416",
        "source": 2,
        "contract_ids": [contractId],
        "amount_list": [price]
  });
      final jsonMap = response.data as Map<String, dynamic>;
      if (jsonMap['success'] == true) {
        return jsonMap['sber_url'];
      } else {
        return 'error!';
      }
    } catch (e) {
      rethrow;
    }
  }
}
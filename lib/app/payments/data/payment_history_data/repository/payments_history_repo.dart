import '../payments_history_model/payments_history_model.dart';
import '../payments_services_ds/payments_services_ds.dart';

class ListPaymentsHistoryRepository {
  final _apiDS = PaymentsHistoryDS();

  Future<List<PaymentsHistoryModel>> fetchHistory(String id) async {
    final paymentsHistory = await _apiDS
        .getPaymentsHistory(id)
        .catchError((e) => Future.value(<Map<String, dynamic>>[]))
        .then((value) => value.map(PaymentsHistoryModel.fromJson));

    return paymentsHistory.toList();
  }
}
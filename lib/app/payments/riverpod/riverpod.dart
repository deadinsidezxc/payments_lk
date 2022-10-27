import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/contracts_data/contract_model/contract_model.dart';
import '../data/contracts_data/repository/contracts_repo.dart';
import '../data/payment_history_data/payments_history_model/payments_history_model.dart';
import '../data/payment_history_data/repository/payments_history_repo.dart';

final summProvider = StateProvider<int>((ref) => 0);
final countProvider = StateProvider<int>((ref) => 0);
final checkedProvider = StateProvider<List<ContractModel>>((ref) => []);

final contractsProvider = FutureProvider<List<ContractModel>>((ref) async {
  final repository = ListContractsRepository();
  return await repository.fetchContracts();
});

final paymentsHistoryProvider = FutureProvider.family<List<PaymentsHistoryModel>, String>((ref, id) async {
  final repository = ListPaymentsHistoryRepository();
  return await repository.fetchHistory(id);
});
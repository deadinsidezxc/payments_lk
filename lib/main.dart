import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/singletons/local_storage.dart';
import 'data/contracts_data/contract_model/contract_model.dart';
import 'data/contracts_data/repository/contracts_repo.dart';

final summProvider = StateProvider<int>((ref) => 0);
final countProvider = StateProvider<int>((ref) => 0);
final checkedProvider = StateProvider<List<ContractModel>>((ref) => []);

final contractsProvider = FutureProvider<List<ContractModel>>((ref) async {
  final repository = ListContractsRepository();
  return await repository.fetchContracts();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  runApp(
      ProviderScope(
        child: MyApp(),
      ),
  );
}


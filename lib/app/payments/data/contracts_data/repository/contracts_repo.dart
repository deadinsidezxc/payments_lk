import '../../contracts_id_data/contract_id_model/contract_id_model.dart';
import '../contract_ds/contracts_ds.dart';
import '../contract_model/contract_model.dart';

class ListContractsRepository {
  final _apiDS = ContractsDS();

  Future<List<ContractModel>> fetchContracts() async {
    final contracts = await _apiDS
        .getContracts()
        .catchError((e) => Future.value(<Map<String, dynamic>>[]))
        .then((value) => value.map(ContractModel.fromJson));


    final idMap = await _apiDS
        .getContractsIds()
        .catchError((e) => Future.value(<Map<String, dynamic>>[]))
        .then((e) => e.map(ContractIDModel.fromJson));

    return contracts
        .toList()
        .asMap()
        .entries
        .map((e) => e.value.copyWith(
        id: idMap.toList()[e.key].id.toString())).toList();
  }
}
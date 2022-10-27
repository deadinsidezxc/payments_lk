import 'package:dio/dio.dart';
import '../../../core/dictionaries/dio_configurations.dart';
import '../../get_uid_data/repository/uid_repo.dart';

class ContractsDS {
  final _diov3 = Dio(baseOptionsV3);
  final _diov2 = Dio(baseOptionsV2);

  Future<List<Map<String, dynamic>>> getContracts() async {
    final repository = ListUidRepository();
    final uidData = await repository.fetchUid();
    final uid = uidData.first.uid ?? '';
    try {
      final response = await _diov3.get('contracts/by_uid/$uid');
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

  Future<List<Map<String, dynamic>>> getContractsIds() async {
    try {
      final response = await _diov2.post('getContracts');
      final jsonMap = response.data as Map<String, dynamic>;
      if(jsonMap['success'] == true) {
        return List<Map<String, dynamic>>.from(jsonMap['contracts']);
      }
      throw Error;
    } catch(e) {
      return <Map<String, dynamic>>[];
    }
  }
}
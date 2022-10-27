import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_api/data/get_uid_data/uid_ds/uid_ds.dart';

import '../uid_model/uid_model.dart';

class ListUidRepository {
  final _apiDS = GetUidDS();

  Future<List<GetUidModel>> fetchUid() async {
    final uid = await _apiDS
        .getUid()
        .catchError((e) => Future.value(<Map<String, dynamic>>[]))
        .then((value) => value.map(GetUidModel.fromJson));

    return uid.toList();
  }
}
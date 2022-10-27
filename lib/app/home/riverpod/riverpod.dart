import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/security_object/security_object.dart';
import '../data/repository/objects_repository.dart';

final listObjectsProvider = FutureProvider<List<SecurityObject>>((ref) async {
  final repository = ListSecurityObjectsRepository();
  return await repository.fetchObjects();
});

final selectedObjectProvider = Provider.autoDispose<SecurityObject?>((ref) {
  final objects = ref.watch(listObjectsProvider).valueOrNull;
  final id = ref.watch(selectedIdProvider);

  return objects?.firstWhere((object) => object.id == id);
});

final selectedIdProvider = StateProvider<int?>((ref) => null);

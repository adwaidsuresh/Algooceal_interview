import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_dog/services/api_service.dart';

final apiserviceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
final getpostProvider = FutureProvider((ref) async {
  return ref.watch(apiserviceProvider).getpost();
});
final refreshProvider = Provider.autoDispose<void>((ref) async {
  return await ref.refresh(getpostProvider);
});
final bottomProvider = StateProvider<int>((ref) {
  return 0;
});

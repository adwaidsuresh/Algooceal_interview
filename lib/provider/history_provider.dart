import 'package:random_dog/modelclasses/history_entity.dart';
import 'package:random_dog/services/store_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../modelclasses/api_model_class.dart';
part 'history_provider.g.dart';

@riverpod
List<HistoryEntity> history(HistoryRef ref) {
  return ObjectBox.historyBox.getAll();
}

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  List<HistoryEntity> build() {
    return ref.watch(historyProvider);
  }

  void addToHistory(Dog item) {
    ObjectBox.historyBox.put(HistoryEntity(
      price: item.price!,
      message: item.message!,
    ));
    state = List.from(ref.refresh(historyProvider));
  }

  void removeFromHistory() {
    ObjectBox.historyBox.removeAll();
    state = List.from(ref.refresh(historyProvider));
  }
}

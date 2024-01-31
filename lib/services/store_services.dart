import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:random_dog/modelclasses/history_entity.dart';

import '../modelclasses/cart_entity.dart';
import '../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  static late final Box<CartEntity> cartBox;
  static late final Box<HistoryEntity> historyBox;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
    cartBox = store.box<CartEntity>();
    historyBox = store.box<HistoryEntity>();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }
}

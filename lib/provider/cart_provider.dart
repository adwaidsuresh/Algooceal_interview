import 'package:random_dog/modelclasses/cart_entity.dart';
import 'package:random_dog/services/store_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../modelclasses/api_model_class.dart';
part 'cart_provider.g.dart';

@riverpod
List<CartEntity> cart(CartRef ref) {
  return ObjectBox.cartBox.getAll();
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  List<CartEntity> build() {
    return ref.watch(cartProvider);
  }

  int totalPrice() {
    int sum = 0;
    for (var item in state) {
      sum = sum + item.price;
    }
    return sum;
  }

  void addToCart(Dog item) {
    ObjectBox.cartBox.put(CartEntity(
      price: item.price!,
      message: item.message!,
    ));
    state = List.from(ref.refresh(cartProvider));
  }

  void removeFromCart(int id) {
    ObjectBox.cartBox.remove(id);
    state = List.from(ref.refresh(cartProvider));
  }
}

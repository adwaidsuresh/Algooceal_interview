import 'package:objectbox/objectbox.dart';

@Entity()
class CartEntity {
  @Id()
  int id = 0;
  int price;
  String message;

  CartEntity({
    this.id = 0,
    required this.price,
    required this.message,
  });
}

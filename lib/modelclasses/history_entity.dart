import 'package:objectbox/objectbox.dart';

@Entity()
class HistoryEntity {
  @Id()
  int id = 0;
  int price;
  String message;

  HistoryEntity({
    this.id = 0,
    required this.price,
    required this.message,
  });
}

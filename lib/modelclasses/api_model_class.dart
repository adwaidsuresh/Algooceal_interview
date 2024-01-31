import 'dart:convert';
import 'dart:math';

Dog dogFromJson(String str) => Dog.fromJson(json.decode(str));

class Dog {
  String? message;
  String? status;
  int? price;

  Dog({
    this.message,
    this.status,
    this.price,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        message: json["message"],
        status: json["status"],
        price: getRandomPrice(),
      );

  static int getRandomPrice() {
    return Random().nextInt(900) + 100;
  }
}

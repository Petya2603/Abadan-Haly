import 'package:haly/app/data/cart_item_model.dart';

class Order {
  final String id;
  final DateTime orderDate;
  final List<CartItem> items;

  Order({
    required this.id,
    required this.orderDate,
    required this.items,
  });
}

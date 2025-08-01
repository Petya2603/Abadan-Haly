import 'package:haly/app/data/carpet_model.dart';

class CartItem {
  final String imagePath;
  final String name;
  final String code;
  final CarpetColor? color;
  final Figure? shape;
  final Size? size;
  int quantity;

  CartItem({
    required this.imagePath,
    required this.name,
    required this.code,
    this.color,
    this.shape,
    this.size,
    required this.quantity,
  });
}

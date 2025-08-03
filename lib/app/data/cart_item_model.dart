import 'package:haly/app/data/carpet_model.dart';

class CartItem {
  final Product product;
  int quantity;
  final String colorName;
  final String size;

  CartItem({
    required this.product,
    required this.quantity,
    required this.colorName,
    required this.size,
  });

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
        'quantity': quantity,
        'colorName': colorName,
        'size': size,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
        colorName: json['colorName'],
        size: json['size'],
      );
}
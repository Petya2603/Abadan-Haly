import 'package:haly/app/data/carpet_model.dart';

class CartItem {
  final Product product;
  int quantity;
  final String colorName;
  final String size;
  final String imageUrl;

  CartItem({
    required this.product,
    required this.quantity,
    required this.colorName,
    required this.size,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
        'quantity': quantity,
        'colorName': colorName,
        'size': size,
        'imageUrl': imageUrl,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
        colorName: json['colorName'],
        size: json['size'],
        imageUrl: json['imageUrl'] ?? Product.fromJson(json['product']).figures.first.colors.first.image,
      );
}
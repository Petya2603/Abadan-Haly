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

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'code': code,
        'color': color?.toJson(),
        'shape': shape?.toJson(),
        'size': size?.toJson(),
        'quantity': quantity,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        imagePath: json['imagePath'],
        name: json['name'],
        code: json['code'],
        color: json['color'] != null
            ? CarpetColor.fromJson(json['color'])
            : null,
        shape: json['shape'] != null ? Figure.fromJson(json['shape']) : null,
        size: json['size'] != null ? Size.fromJson(json['size']) : null,
        quantity: json['quantity'],
      );
}

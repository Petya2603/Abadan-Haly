import 'package:flutter/material.dart';
import 'package:haly/app/modules/cart/widgets/cart_bottom_bar.dart';
import 'package:haly/app/modules/cart/widgets/cart_item_card.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      {
        "name": "Güneş",
        "code": "9122",
        "size": "5×7",
        "color": "Krem",
        "shape": "Gönüburçly",
        "image": "assets/images/category_product1.jpg"
      },
      {
        "name": "Nusaý",
        "code": "9122",
        "size": "5×7",
        "color": "Krem",
        "shape": "Yolluk",
        "image": "assets/images/category_product2.jpg"
      },
    ];

    return Scaffold(
      appBar: customAppBar(),
      body: ListView.builder(
        itemCount: cartItems.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return CartItemCard(item: item);
        },
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
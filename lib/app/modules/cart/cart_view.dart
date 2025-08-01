import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:haly/app/modules/cart/cart_controller.dart'; // Import CartController
import 'package:haly/app/modules/cart/widgets/cart_bottom_bar.dart';
import 'package:haly/app/modules/cart/widgets/cart_item_card.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController()); // Get CartController instance

    return Scaffold(
      appBar: customAppBar(),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cartItems.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final item = cartController.cartItems[index];
            // You might need to adjust CartItemCard to accept CartItem object directly
            // For now, I'll pass a Map, but ideally CartItemCard should be updated.
            return CartItemCard(cartItem: item);
          },
        ),
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:haly/app/modules/cart/cart_controller.dart'; // Import CartController
import 'package:haly/app/modules/cart/widgets/cart_bottom_bar.dart';
import 'package:haly/app/modules/cart/widgets/cart_item_card.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cartItems.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final item = cartController.cartItems[index];

            return CartItemCard(cartItem: item);
          },
        ),
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}

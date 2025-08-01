import 'package:get/get.dart';
import 'package:haly/app/data/cart_item_model.dart';
import 'package:haly/app/data/order_model.dart'; // Import Order model
import 'package:haly/app/modules/order/order_controller.dart'; // Import OrderController
import 'package:haly/app/modules/order/order_view.dart'; // Import OrderView

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;
  final OrderController _orderController = Get.find<OrderController>(); // Get OrderController instance

  void addToCart(CartItem item) {
    final existingItemIndex = cartItems.indexWhere(
      (cartItem) =>
          cartItem.code == item.code &&
          cartItem.color?.hexCode == item.color?.hexCode &&
          cartItem.shape?.id == item.shape?.id &&
          cartItem.size?.id == item.size?.id,
    );

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += item.quantity;
      cartItems.refresh(); // Notify listeners about the change
    } else {
      cartItems.add(item);
    }
    Get.snackbar(
      'Sepet',
      'Ürün sepete eklendi!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh(); // Notify listeners about the change
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      cartItems.refresh(); // Notify listeners about the change
    } else {
      removeFromCart(item);
    }
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    Get.snackbar(
      'Sepet',
      'Ürün sepetten çıkarıldı!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void placeOrder() {
    if (cartItems.isEmpty) {
      Get.snackbar(
        'Hata',
        'Sepetiniz boş, sipariş oluşturulamaz!',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final newOrder = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID for the order
      orderDate: DateTime.now(),
      items: List<CartItem>.from(cartItems), // Create a copy of cart items for the order
    );

    _orderController.addOrder(newOrder);
    cartItems.clear(); // Clear the cart after placing the order
    Get.to(() => const OrderView()); // Navigate to OrderView
  }
}

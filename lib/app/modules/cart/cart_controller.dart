import 'package:get/get.dart';
import 'package:haly/app/data/cart_item_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

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
}

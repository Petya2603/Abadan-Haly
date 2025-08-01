import 'package:get/get.dart';
import 'package:haly/app/data/order_model.dart';

class OrderController extends GetxController {
  final RxList<Order> orders = <Order>[].obs;

  void addOrder(Order order) {
    orders.add(order);
    Get.snackbar(
      'Sipariş',
      'Siparişiniz oluşturuldu!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haly/app/data/order_model.dart';

class OrderController extends GetxController {
  final RxList<Order> orders = <Order>[].obs;
  final _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storedOrders = _box.read('orders');
    if (storedOrders != null) {
      orders.assignAll(storedOrders.map((e) => Order.fromJson(e)).toList());
    }
    ever(orders, (_) => _saveOrdersToStorage());
  }

  void _saveOrdersToStorage() {
    _box.write('orders', orders.toList());
  }

  void addOrder(Order order) {
    orders.add(order);
    Get.snackbar(
      'Sipariş',
      'Siparişiniz oluşturuldu!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

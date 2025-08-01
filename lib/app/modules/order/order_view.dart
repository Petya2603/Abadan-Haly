import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/order/order_controller.dart';
import 'package:haly/app/modules/order/order_detail_view.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());

    return Scaffold(
      appBar: customAppBar(),
      body: Obx(
        () => orderController.orders.isEmpty
            ? const Center(
                child: Text(
                  'Henüz siparişiniz bulunmamaktadır.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: orderController.orders.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final order = orderController.orders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      title: Text('Sipariş ID: ${order.id}'),
                      subtitle: Text(
                          'Tarih: ${order.orderDate.toLocal().toString().split(' ')[0]}'),
                      trailing: Text('Ürün Sayısı: ${order.items.length}'),
                      onTap: () {
                        Get.to(() => OrderDetailView(order: order));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

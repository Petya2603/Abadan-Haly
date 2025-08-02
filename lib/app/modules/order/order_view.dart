import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/order/order_controller.dart';
import 'package:haly/app/modules/order/order_detail_view.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

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
            : ListView.separated(
                itemCount: orderController.orders.length,
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final order = orderController.orders[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromARGB(255, 245, 245, 245),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedDocumentAttachment,
                        size: 24,
                        color: AppColors.green,
                      ),
                    ),
                    title: Text(
                      'Order ID (${order.id})',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: Fonts.gilroySemiBold,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Text(
                      DateFormat('dd.MM.yyyy').format(order.orderDate),
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: Fonts.gilroyRegular,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => OrderDetailView(order: order));
                    },
                  );
                },
              ),
      ),
    );
  }
}

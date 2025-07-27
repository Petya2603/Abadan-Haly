import 'package:flutter/material.dart';
import 'package:haly/app/modules/order/widgets/order_item_card.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class OrderListView extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {"id": "Order ID (1)", "date": "14.07.2025"},
    {"id": "Order ID (2)", "date": "14.07.2025"},
    {"id": "Order ID (3)", "date": "14.07.2025"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tassyklanan sargytlar",
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: Fonts.gilroySemiBold,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ...orders.map((order) {
              return OrderItemCard(
                orderId: order["id"]!,
                orderDate: order["date"]!,
              );
            }),
          ],
        ),
      ),
    );
  }
}

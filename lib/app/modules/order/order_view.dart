import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                      color: const Color.fromARGB(255, 245, 245, 245)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.sargutlar,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        order["id"]!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.gilroySemiBold),
                      ),
                    ),
                    Text(order["date"]!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

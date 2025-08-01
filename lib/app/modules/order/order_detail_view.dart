import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/data/order_model.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class OrderDetailView extends StatelessWidget {
  final Order order;

  const OrderDetailView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sipariş ID: ${order.id}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Sipariş Tarihi: ${order.orderDate.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sipariş Edilen Ürünler:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return Container(
                    height: 394,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1),
                          child: Image.file(
                            File(item.imagePath),
                            width: 230,
                            height: 329,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: Fonts.gilroySemiBold)),
                              const SizedBox(height: 5),
                              Text("Kody: ${item.code}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.gilroyMedium)),
                              const SizedBox(height: 5),
                              Text(
                                  "Ölçegi : ${item.size != null ? '${item.size!.width}x${item.size!.height} ${item.size!.measurementUnit}' : '-'}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.gilroyMedium)),
                              const SizedBox(height: 5),
                              Text(
                                  "Rengi :   ${item.color != null ? item.color!.name : '-'}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.gilroyMedium)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Text("Geometriki şekli",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.gilroyMedium)),
                                  const SizedBox(width: 10),
                                  Chip(
                                    label: Text(
                                        item.shape != null
                                            ? item.shape!.name
                                            : '-',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: Fonts.gilroyMedium)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 239, 244, 254),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Miktar: ${item.quantity}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Fonts.gilroySemiBold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

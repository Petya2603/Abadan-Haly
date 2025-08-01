import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/data/order_model.dart';
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
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.file(
                              File(item.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Miktar: ${item.quantity}'),
                                if (item.color != null)
                                  Text('Renk: ${item.color!.name}'),
                                if (item.size != null)
                                  Text('Boyut: ${item.size!.width}x${item.size!.height} ${item.size!.measurementUnit}'),
                                if (item.shape != null)
                                  Text('Şekil: ${item.shape!.name}'),
                              ],
                            ),
                          ),
                        ],
                      ),
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

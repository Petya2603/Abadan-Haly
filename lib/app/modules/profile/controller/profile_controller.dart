import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haly/app/data/data_service.dart';
import 'package:haly/app/modules/home/controller/home_controller.dart';
import 'package:haly/app/modules/search/controller/search_controller.dart'
    as search_controller;
import 'package:haly/app/modules/profile/widgets/import_progress_dialog.dart';
import 'package:haly/app/modules/order/order_controller.dart'; // Import OrderController
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // Import dart:convert for JSON encoding

import 'package:hugeicons/hugeicons.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final DataService dataService = DataService();
  final RxDouble downloadProgress = 0.0.obs;
  final _box = GetStorage();

  String get domain => _box.read('domain') ?? 'https://carpet.sada-devs.com';

  Future<void> importData() async {
    Get.dialog(
      ImportProgressDialog(controller: this),
      barrierDismissible: false,
    );

    try {
      await dataService.importDataFromApi(onProgress: (progress) {
        downloadProgress.value = progress;
      });
      Get.find<HomeController>().fetchCarpetData();
      // Refresh other controllers
      if (Get.isRegistered<search_controller.SearchController>()) {
        Get.find<search_controller.SearchController>().fetchData();
      }
      Get.back();
      Get.snackbar(
        'Üstünlikli Tamamlandy',
        'Maglumatlar üstünlikli ýüklenildi!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedCloudDownload,
          size: 28,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(12),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Internet Baglanyşygy Ýok',
        'Maglumatlary ýüklemek başartmady. Internet baglanyşygyňyzy barlaň.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedWifiOff01,
          size: 28,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(12),
        borderRadius: 8,
        duration: const Duration(seconds: 4),
      );
    } finally {
      downloadProgress.value = 0.0;
    }
  }

  Future<void> uploadOrders() async {
    final OrderController orderController = Get.find<OrderController>();
    if (orderController.orders.isEmpty) {
      Get.snackbar(
        'Hata',
        'Gönderilecek sipariş bulunmamaktadır.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.dialog(
      ImportProgressDialog(controller: this),
      barrierDismissible: false,
    );

    try {
      final List<Map<String, dynamic>> ordersToUpload = [];
      for (var order in orderController.orders) {
        for (var item in order.items) {
          ordersToUpload.add({
            "order_id": order.id,
            "category": item.name,
            "product_code": item.code,
            "size": item.size != null
                ? '${item.size!.width}x${item.size!.height} ${item.size!.measurementUnit}'
                : '-',
            "color": item.color != null ? item.color!.name : '-',
            "figure": item.shape != null ? item.shape!.name : '-',
            "quantity": item.quantity.toString(),
          });
        }
      }

      final url = Uri.parse('$domain/api/sync/orders');
      final headers = {'Content-Type': 'application/json'};
      final body = json.encode(ordersToUpload);
      for (int i = 0; i <= 100; i += 10) {
        downloadProgress.value = i / 100.0;
        await Future.delayed(const Duration(milliseconds: 100));
      }

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(
          'Üstünlikli',
          'Siparişler başarıyla gönderildi!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        orderController.orders.clear();
      } else {
        Get.back();
        Get.snackbar(
          'Hata',
          'Siparişler gönderilirken bir hata oluştu: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Hata',
        'Siparişler gönderilirken bir hata oluştu: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      downloadProgress.value = 0.0;
    }
  }
}

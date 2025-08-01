import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/data/data_service.dart';
import 'package:haly/app/modules/home/controller/home_controller.dart';
import 'package:haly/app/modules/search/controller/search_controller.dart'
    as search_controller;
import 'package:haly/app/modules/profile/widgets/import_progress_dialog.dart';

import 'package:hugeicons/hugeicons.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final DataService dataService = DataService();
  final RxDouble downloadProgress = 0.0.obs;

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
}

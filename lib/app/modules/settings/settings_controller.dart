import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _box = GetStorage();
  final domainController = TextEditingController();
  final RxString savedDomain = ''.obs;

  @override
  void onInit() {
    super.onInit();
    savedDomain.value = _box.read('domain') ?? 'https://carpet.sada-devs.com';
    domainController.text = savedDomain.value;
  }

  void saveDomain() {
    final newDomain = domainController.text;
    if (newDomain.isNotEmpty) {
      _box.write('domain', newDomain);
      savedDomain.value = newDomain;
      Get.snackbar('Başarılı', 'Alan adı kaydedildi');
    } else {
      Get.snackbar('Hata', 'Alan adı boş olamaz');
    }
  }
}

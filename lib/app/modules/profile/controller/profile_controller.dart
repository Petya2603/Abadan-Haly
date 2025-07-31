import 'package:get/get.dart';
import 'package:haly/app/data/data_service.dart';
import 'package:haly/app/modules/home/controller/home_controller.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final DataService dataService = DataService();

  Future<void> importData() async {
    isLoading(true);
    try {
      await dataService.importDataFromApi();
      Get.find<HomeController>().fetchCarpetData();
      Get.snackbar('Success', 'Data imported successfully!', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to import data: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}

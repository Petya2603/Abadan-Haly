import 'package:get/get.dart';
import 'package:haly/app/modules/onboarding/onboarding_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => OnboardingScreen());
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/bottomnavbar/bottom_nav_bar.dart';
import 'package:haly/app/modules/onboarding/views/onboarding_view.dart';
import 'package:haly/app/modules/onboarding/widgets/splash_content.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  void _checkFirstLaunch() async {
    final box = GetStorage();
    bool? isFirstLaunch = box.read('isFirstLaunch');

    await Future.delayed(const Duration(seconds: 4));

    if (isFirstLaunch == null || isFirstLaunch == true) {
      await box.write('isFirstLaunch', false);
      Get.off(() => OnboardingScreen());
    } else {
      Get.off(() => CustomBottomNavBar());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          return SplashContent(isTablet: isTablet);
        },
      ),
    );
  }
}

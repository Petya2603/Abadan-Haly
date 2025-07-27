import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingPageIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: controller.currentPage.value == index ? 12 : 12,
            height: 12,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: controller.currentPage.value == index
                  ? AppColors.green
                  : const Color.fromARGB(255, 215, 223, 223),
              borderRadius: BorderRadii.borderRadius50,
            ),
          );
        }),
      ),
    );
  }
}

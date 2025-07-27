import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:haly/app/modules/onboarding/widgets/onboarding_navigation_buttons.dart';
import 'package:haly/app/modules/onboarding/widgets/onboarding_page.dart';
import 'package:haly/app/modules/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      'image': Assets.onboarding1,
      'title': 'Abadan hala hoş geldiňiz',
      'desc':
          'Döwrebap nusgawy dizaýnlarda — stiliňize, giňişligiňize laýyk gelýän halylary biz bilen saýlaň.',
    },
    {
      'image': Assets.onboarding2,
      'title': 'Öýüňiziň bezegi -Abadan haly',
      'desc': 'Dürli görnüşdäki halylar',
    },
    {
      'image': Assets.onboarding3,
      'title': 'Sargyt ediň',
      'desc':
          'Ykjam goşundy arkaly oturan ýeriňizden islendik görnüşdäki halylary sargyt ediň.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          return Column(
            children: [
              Expanded(
                flex: 10,
                child: PageView.builder(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) =>
                      controller.currentPage.value = index,
                  itemCount: onboardingData.length,
                  itemBuilder: (_, index) {
                    return OnboardingPage(
                      isTablet: isTablet,
                      image: onboardingData[index]['image']!,
                      title: onboardingData[index]['title']!,
                      desc: onboardingData[index]['desc']!,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 70.0 : 12.0,
                      vertical: isTablet ? 20.0 : 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: OnboardingPageIndicator(controller: controller),
                      ),
                      const SizedBox(height: 10),
                      OnboardingNavigationButtons(
                        controller: controller,
                        isTablet: isTablet,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

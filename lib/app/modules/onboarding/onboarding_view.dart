import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/bottomnavbar/bottom_nav_bar.dart';
import 'package:haly/app/modules/home/home_view.dart';
import 'package:haly/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:haly/app/modules/onboarding/widgets/onboarding_page.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnboardingController());

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
                        child: Obx(() => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(3, (index) {
                                return AnimatedContainer(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  width: controller.currentPage.value == index
                                      ? 12
                                      : 12,
                                  height: 12,
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color: controller.currentPage.value == index
                                        ? AppColors.green
                                        : const Color.fromARGB(
                                            255, 215, 223, 223),
                                    borderRadius: BorderRadii.borderRadius50,
                                  ),
                                );
                              }),
                            )),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: isTablet ? 60 : 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadii.borderRadius12,
                            ),
                          ),
                          onPressed: controller.nextPage,
                          child: Text(
                            'Dowam et',
                            style: TextStyle(
                                fontSize: isTablet ? 20 : 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: Fonts.gilroySemiBold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(CustomBottomNavBar());
                        },
                        child: Text(
                          'Göni geçmek',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 39, 39, 40),
                              fontWeight: FontWeight.w600,
                              fontFamily: Fonts.gilroySemiBold,
                              fontSize: isTablet ? 20 : 16),
                        ),
                      )
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

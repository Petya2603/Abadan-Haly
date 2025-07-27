import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/onboarding/controller/splash_controller.dart';
import 'package:haly/app/modules/onboarding/widgets/splash_text_gradient.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.logo,
                  width: isTablet ? 313.62 : 200,
                  height: isTablet ? 193 : 100,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: isTablet ? 160 : 20),
                  alignment: Alignment.center,
                  child: GradientText(
                    text: 'Owadan haly...',
                    style: TextStyle(
                      fontSize: isTablet ? 30 : 18,
                      fontFamily: Fonts.script,
                      fontWeight: FontWeight.w700,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 147, 61, 1),
                        Color.fromRGBO(0, 0, 0, 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

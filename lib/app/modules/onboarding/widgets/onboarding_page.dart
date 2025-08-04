// widgets/onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:haly/app/theme/theme/app_theme.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final bool isTablet;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
        SizedBox(height: isTablet ? 35 : 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            children: [
              Image.asset(
                Assets.logo,
                fit: BoxFit.cover,
                width: isTablet ? 170 : 150,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                    fontSize: isTablet ? 42 : 24,
                    fontFamily: Fonts.gilroySemiBold,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: isTablet ? 55 : 40,
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 102, 102, 102),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

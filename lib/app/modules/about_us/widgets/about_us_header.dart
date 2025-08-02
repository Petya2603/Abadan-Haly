import 'package:flutter/material.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class AboutUsHeader extends StatelessWidget {
  final bool isTablet;

  const AboutUsHeader({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4,
          width: double.infinity,
          color: const Color.fromRGBO(245, 245, 245, 1),
        ),
        SizedBox(height: isTablet ? 24 : 16),
        Center(
          child: Image.asset(
            Assets.logo,
            height: isTablet ? 102 : 60,
            width: 166,
          ),
        ),
        SizedBox(height: isTablet ? 24 : 16),
        Text(
          "Biz barada",
          style: TextStyle(
            fontSize: isTablet ? 16 : 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: isTablet ? 10 : 5),
      ],
    );
  }
}

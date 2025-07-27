import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class ProfileOptionCard extends StatelessWidget {
  final String title;
  final String iconPath;

  const ProfileOptionCard({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 247, 247),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
      ),
      child: Column(children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: Fonts.gilroySemiBold,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

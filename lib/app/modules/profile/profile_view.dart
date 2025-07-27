import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class ProfileView extends StatelessWidget {
  final List<Map<String, String>> options = [
    {"title": "Settings", "icon": Assets.settings},
    {"title": "Sargytlarym", "icon": Assets.sargutlar},
    {"title": "Tassyklanan harytlar", "icon": Assets.tas_sar},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: ListView.separated(
        padding: const EdgeInsets.all(25),
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = options[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 247, 247),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
            ),
            child: Column(children: [
              Row(
                children: [
                  SvgPicture.asset(
                    item["icon"]!,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item["title"]!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: Fonts.gilroySemiBold,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                    height: 16,
                    width: 16,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}

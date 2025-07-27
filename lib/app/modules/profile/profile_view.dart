import 'package:flutter/material.dart';
import 'package:haly/app/modules/profile/widgets/profile_option_card.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
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
          return ProfileOptionCard(
            title: item["title"]!,
            iconPath: item["icon"]!,
          );
        },
      ),
    );
  }
}
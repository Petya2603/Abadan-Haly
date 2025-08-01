import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/profile/controller/profile_controller.dart';
import 'package:haly/app/modules/profile/widgets/profile_option_card.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class ProfileView extends StatelessWidget {
  final List<Map<String, String>> options = [
    {"title": "Settings", "icon": Assets.settings},
    {"title": "Sargytlarym", "icon": Assets.sargutlar},
    {"title": "Tassyklanan harytlar", "icon": Assets.tasSar},
    {
      "title": "Maglumatlary ýüklemegiňizi haýyş edýarin",
      "icon": "assets/images/Box_alt_fill.svg"
    },
    {
      "title": "Maglumatlary ugrat",
      "icon": "assets/images/Box_alt.svg" // Placeholder icon
    },
  ];

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: customAppBar(),
      body: ListView.separated(
        padding: const EdgeInsets.all(25),
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = options[index];
          return GestureDetector(
            onTap: () async {
              if (item["title"] == "Maglumatlary ýüklemegiňizi haýyş edýarin") {
                await controller.importData();
              } else if (item["title"] == "Maglumatlary ugrat") {
                await controller.uploadOrders();
              }
            },
            child: ProfileOptionCard(
              title: item["title"]!,
              iconPath: item["icon"]!,
              isLoading: false.obs,
            ),
          );
        },
      ),
    );
  }
}

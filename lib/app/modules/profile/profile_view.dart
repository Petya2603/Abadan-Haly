import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/profile/controller/profile_controller.dart';
import 'package:haly/app/modules/profile/widgets/profile_option_card.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileView extends StatelessWidget {
  final List<Map<String, Object>> options = [
    {"title": "Sazlamalar", "icon": HugeIcons.strokeRoundedSetting06},
    {"title": "Sargytlarym", "icon": HugeIcons.strokeRoundedNote02},
    {"title": "Tassyklanan harytlar", "icon": HugeIcons.strokeRoundedCheckList},
    {
      "title": "Maglumatlary ýükle",
      "icon": HugeIcons.strokeRoundedDownloadCircle02
    },
    {
      "title": "Maglumatlary iber",
      "icon": HugeIcons.strokeRoundedUploadCircle02
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
              title: item["title"]! as String,
              iconPath: item["icon"]! as IconData,
              isLoading: false.obs,
            ),
          );
        },
      ),
    );
  }
}

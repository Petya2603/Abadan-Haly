import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/about_us/about_us_view.dart';
import 'package:haly/app/modules/category/category_view.dart';
import 'package:haly/app/modules/contacted/contacted_view.dart';

import 'package:haly/app/modules/home/widgets/carpet_card.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        title: Image.asset(
          Assets.logo,
          height: 80,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(AboutUsView());
              },
              child: Text("Biz barada",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Fonts.gilroySemiBold,
                      fontSize: 24,
                      fontWeight: FontWeight.w600))),
          TextButton(
              onPressed: () {
                Get.to(ContactScreen());
              },
              child: Text("Habarlaşmak",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Fonts.gilroySemiBold,
                      fontSize: 24,
                      fontWeight: FontWeight.w600))),
          const SizedBox(width: 8),
        ],
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HALY GÖRNÜŞLERI',
                  style: TextStyle(
                      fontSize: isTablet ? 24 : 18,
                      color: Colors.black,
                      fontFamily: Fonts.gilroySemiBold,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: isTablet ? 2 : 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.50,
                    children: [
                      CarpetCard(
                        title: 'Güneş',
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 168, 168, 168),
                          Color.fromARGB(255, 135, 129, 129)
                        ]),
                        image: Assets.card1,
                        isTablet: isTablet,
                        onTap: () => Get.to(() => CategoryView(title: 'Güneş')),
                      ),
                      CarpetCard(
                        title: 'Çeper',
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 59, 94, 164),
                          Color.fromARGB(255, 49, 76, 132)
                        ]),
                        image: Assets.card2,
                        isTablet: isTablet,
                        onTap: () => Get.to(() => CategoryView(title: 'Çeper')),
                      ),
                      CarpetCard(
                        title: 'Nusaý',
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 201, 53, 19),
                          Color.fromARGB(255, 117, 33, 14)
                        ]),
                        image: Assets.card3,
                        isTablet: isTablet,
                        onTap: () => Get.to(() => CategoryView(title: 'Nusaý')),
                      ),
                      CarpetCard(
                        title: 'Kerwen',
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 97, 113, 71),
                          Color.fromARGB(255, 185, 215, 135)
                        ]),
                        image: Assets.card4,
                        isTablet: isTablet,
                        onTap: () =>
                            Get.to(() => CategoryView(title: 'Kerwen')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

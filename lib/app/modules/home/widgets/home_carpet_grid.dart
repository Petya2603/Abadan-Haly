import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/view/category_view.dart';
import 'package:haly/app/modules/home/widgets/carpet_card.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class HomeCarpetGrid extends StatelessWidget {
  final bool isTablet;

  const HomeCarpetGrid({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
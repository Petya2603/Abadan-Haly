import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/home/controller/home_controller.dart';
import 'package:haly/app/modules/category/view/category_view.dart';
import 'package:haly/app/modules/home/widgets/carpet_card.dart';

class HomeCarpetGrid extends StatelessWidget {
  final bool isTablet;

  const HomeCarpetGrid({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.hasError.value) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No local data found. Please go to the profile page and import data.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        } else if (controller.carpetData.value == null || controller.carpetData.value!.categories.isEmpty) {
          return const Center(child: Text('No categories found'));
        } else {
          final categories = controller.carpetData.value!.categories;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 2 : 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.50,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CarpetCard(
                title: category.name,
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 168, 168, 168),
                  Color.fromARGB(255, 135, 129, 129)
                ]),
                image: category.image,
                isTablet: isTablet,
                onTap: () => Get.to(() => CategoryView(title: category.name)),
              );
            },
          );
        }
      }),
    );
  }
}

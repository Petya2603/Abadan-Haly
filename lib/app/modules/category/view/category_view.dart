import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/controller/category_controller.dart';
import 'package:haly/app/modules/category/widgets/category_app_bar.dart';
import 'package:haly/app/modules/category/widgets/category_tabs_section.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class CategoryView extends StatelessWidget {
  final String title;
  CategoryView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());

    return Scaffold(
      appBar: const CategoryAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: Text(
                  '${title} haly',
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: Fonts.gilroySemiBold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: CategoryTabsSection(
                  controller: controller,
                  isTablet: isTablet,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
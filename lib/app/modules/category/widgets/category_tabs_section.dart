import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/controller/category_controller.dart';
import 'package:haly/app/modules/category/widgets/category_grid_view.dart';
import 'package:haly/app/modules/category/widgets/custom_tab_widget.dart';
import 'package:lottie/lottie.dart';

class CategoryTabsSection extends StatelessWidget {
  final CategoryController controller;
  final bool isTablet;

  const CategoryTabsSection({
    super.key,
    required this.controller,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isTabControllerReady.value) {
        return Center(child: SizedBox(width: 40, height: 40, child: Lottie.asset('assets/images/processing-circle.json')));
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                ),
              ),
              width: double.infinity,
              alignment: Alignment.center,
              child: TabBar(
                controller: controller.tabController,
                onTap: (index) {
                  controller.changeTabIndex(index);
                },
                isScrollable: false,
                indicator: const BoxDecoration(),
                indicatorColor: Colors.transparent,
                indicatorWeight: 0,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: isTablet ? 10 : 4),
                tabs: controller.category.value!.subcategories!
                    .map((subcategory) {
                  final index = controller.category.value!.subcategories!
                      .indexOf(subcategory);
                  return Obx(
                    () => buildCustomTab(
                      context,
                      subcategory.name,
                      subcategory.image,
                      isSelected: controller.selectedTabIndex.value == index,
                      isTablet: isTablet,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.category.value!.subcategories!.map((_) {
                return CategoryGridView(isTablet: isTablet);
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}

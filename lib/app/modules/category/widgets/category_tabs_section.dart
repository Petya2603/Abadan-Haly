import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/controller/category_controller.dart';
import 'package:haly/app/modules/category/widgets/category_grid_view.dart';
import 'package:haly/app/modules/category/widgets/custom_tab_widget.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

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
              labelPadding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 4),
              tabs: [
                Obx(
                  () => buildCustomTab(
                    context,
                    "Milli halylar",
                    Assets.tab1,
                    isSelected: controller.selectedTabIndex.value == 0,
                    isTablet: isTablet,
                  ),
                ),
                Obx(
                  () => buildCustomTab(
                    context,
                    "Göni halylar",
                    Assets.tab2,
                    isSelected: controller.selectedTabIndex.value == 1,
                    isTablet: isTablet,
                  ),
                ),
                Obx(
                  () => buildCustomTab(
                    context,
                    "Dekor halylar",
                    Assets.tab3,
                    isSelected: controller.selectedTabIndex.value == 2,
                    isTablet: isTablet,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              CategoryGridView(isTablet: isTablet),
              CategoryGridView(isTablet: isTablet),
              CategoryGridView(isTablet: isTablet),
            ],
          ),
        ),
      ],
    );
  }
}

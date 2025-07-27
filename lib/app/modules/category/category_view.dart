import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/category_controller.dart';

import 'package:haly/app/modules/category/widgets/widgets.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class CategoryView extends StatelessWidget {
  final String title;
  CategoryView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          child: Container(
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.back,
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () => Get.back(),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      Assets.logo,
                      height: 74,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.searchlogo,
                    height: 54,
                    width: 54,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
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
                            context, "Göni halylar", Assets.tab2,
                            isSelected: controller.selectedTabIndex.value == 1,
                            isTablet: isTablet),
                      ),
                      Obx(
                        () => buildCustomTab(
                            context, "Dekor halylar", Assets.tab3,
                            isSelected: controller.selectedTabIndex.value == 2,
                            isTablet: isTablet),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    buildGridView(isTablet),
                    buildGridView(isTablet),
                    buildGridView(isTablet),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildGridView(bool isTablet) {
    final items = List.generate(19, (index) => index);
    return Padding(
      padding: EdgeInsets.all(isTablet ? 16.0 : 8.0),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 231,
          mainAxisSpacing: isTablet ? 24 : 12,
          crossAxisSpacing: isTablet ? 24 : 12,
          childAspectRatio: 231 / 600,
        ),
        itemBuilder: (context, index) {
          return buildProductCard(index, isTablet);
        },
      ),
    );
  }

  Widget buildProductCard(int index, bool isTablet) {
    final cardHeight = isTablet ? 493.0 : 200.0;
    final imageHeight = isTablet ? 318.0 : 120.0;

    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
        border: Border.all(
          color: const Color.fromARGB(255, 231, 231, 231),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: imageHeight,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Image.asset(
              "assets/images/category_product${index % 4 + 1}.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 12 : 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Güneş",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Fonts.gilroySemiBold,
                    fontSize: isTablet ? 20 : 16,
                  ),
                ),
                Text(
                  "0123",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.gilroyMedium,
                    fontSize: isTablet ? 16 : 16,
                    color: const Color.fromARGB(255, 110, 110, 112),
                  ),
                ),
                Text(
                  "KREM",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.gilroyMedium,
                    fontSize: isTablet ? 16 : 16,
                    color: const Color.fromARGB(255, 110, 110, 112),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: isTablet ? 5 : 2,
              right: isTablet ? 5 : 2,
              bottom: isTablet ? 5 : 2,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                minimumSize: Size.fromHeight(44),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                "Görmek",
                style: TextStyle(fontSize: isTablet ? 16 : 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

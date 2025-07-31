import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/controller/category_controller.dart';
import 'package:haly/app/modules/category/widgets/product_card_widget.dart';

class CategoryGridView extends StatelessWidget {
  final bool isTablet;

  const CategoryGridView({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.find();
    final selectedSubcategory = controller.category.value!.subcategories![controller.selectedTabIndex.value];
    final filteredProducts = controller.products.where((p) => p.subcategory.name == selectedSubcategory.name).toList();

    return Padding(
      padding: EdgeInsets.all(isTablet ? 16.0 : 8.0),
      child: GridView.builder(
        itemCount: filteredProducts.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 231,
          mainAxisSpacing: isTablet ? 24 : 12,
          crossAxisSpacing: isTablet ? 24 : 12,
          childAspectRatio: 231 / 600,
        ),
        itemBuilder: (context, index) {
          return buildProductCard(filteredProducts[index], isTablet);
        },
      ),
    );
  }
}

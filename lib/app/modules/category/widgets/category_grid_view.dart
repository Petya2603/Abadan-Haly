import 'package:flutter/material.dart';
import 'package:haly/app/modules/category/widgets/product_card_widget.dart';

class CategoryGridView extends StatelessWidget {
  final bool isTablet;

  const CategoryGridView({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
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
}

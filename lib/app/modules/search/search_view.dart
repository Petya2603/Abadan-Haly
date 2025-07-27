import 'package:flutter/material.dart';
import 'package:haly/app/modules/search/widgets/product_card.dart';
import 'package:haly/app/modules/search/widgets/search_input_field.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
    ];

    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SearchInputField(),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 231,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 231 / 600,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title']!,
                    code: product['code']!,
                    color: product['color']!,
                    imagePath: product['image']!,
                    isTablet: MediaQuery.of(context).size.width > 600,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

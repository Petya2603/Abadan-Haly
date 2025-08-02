import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/category/widgets/product_card_widget.dart';
import 'package:haly/app/modules/search/controller/search_controller.dart'
    as search_controller;
import 'package:haly/app/modules/search/widgets/search_input_field.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final search_controller.SearchController controller =
        Get.put(search_controller.SearchController());
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchInputField(
              focusNode: _focusNode,
              onChanged: (query) => controller.search(query),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  itemCount: controller.filteredProducts.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 231,
                    mainAxisSpacing: isTablet ? 24 : 12,
                    crossAxisSpacing: isTablet ? 24 : 12,
                    childAspectRatio: 231 / 600,
                  ),
                  itemBuilder: (context, index) {
                    return buildProductCard(
                        controller.filteredProducts[index], isTablet);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

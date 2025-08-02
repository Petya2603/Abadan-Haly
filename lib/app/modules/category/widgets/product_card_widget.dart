import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/app_binding.dart';
import 'package:haly/app/data/carpet_model.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

import '../../produts/view/product_detail_view.dart';

Widget buildProductCard(Product product, bool isTablet) {
  final cardHeight = isTablet ? 493.0 : 200.0;
  final imageHeight = isTablet ? 318.0 : 120.0;

  return Container(
    height: cardHeight,
    decoration: BoxDecoration(
      color: AppColors.white,
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
          child: Image.file(
            File(product.figures.first.colors.first.image),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 12 : 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.category.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Fonts.gilroySemiBold,
                  fontSize: isTablet ? 20 : 16,
                ),
              ),
              Text(
                product.code,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: Fonts.gilroyMedium,
                  fontSize: isTablet ? 16 : 16,
                  color: const Color.fromARGB(255, 110, 110, 112),
                ),
              ),
              Text(
                product.figures.first.colors.first.name,
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
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            left: isTablet ? 5 : 2,
            right: isTablet ? 5 : 2,
            bottom: isTablet ? 5 : 2,
          ),
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => ProductDetailView(product: product),
                  binding: AppBinding());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              minimumSize: Size.fromHeight(44),
              foregroundColor: AppColors.white,
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

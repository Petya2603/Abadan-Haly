import 'package:flutter/material.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

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

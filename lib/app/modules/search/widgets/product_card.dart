import 'package:flutter/material.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String code;
  final String color;
  final String imagePath;
  final bool isTablet;

  const ProductCard({
    super.key,
    required this.title,
    required this.code,
    required this.color,
    required this.imagePath,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
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
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(1),
                topRight: Radius.circular(1),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 12 : 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Fonts.gilroySemiBold,
                    fontSize: isTablet ? 20 : 16,
                  ),
                ),
                Text(
                  code,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.gilroyMedium,
                    fontSize: isTablet ? 16 : 16,
                    color: const Color.fromARGB(255, 110, 110, 112),
                  ),
                ),
                Text(
                  color,
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                minimumSize: const Size.fromHeight(44),
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

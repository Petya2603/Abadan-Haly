import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class ProductDetailAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
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
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

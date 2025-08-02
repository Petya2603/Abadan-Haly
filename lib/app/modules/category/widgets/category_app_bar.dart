import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/modules/search/search_view.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({super.key});

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
              icon: const Icon(
                HugeIcons.strokeRoundedArrowLeft01,
                size: 30,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Get.back();
              },
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
              onPressed: () {
                Get.to(() => const SearchView());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

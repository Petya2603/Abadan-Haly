import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});
  final RxInt selectedIndex = 0.obs;

  BottomNavigationBarItem buildNavItem({
    required String selectedIconPath,
    required String unselectedIconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Obx(() {
        final isSelected = selectedIndex.value == index;
        return SvgPicture.asset(
          isSelected ? selectedIconPath : unselectedIconPath,
          width: 32,
          height: 32,
        );
      }),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: selectedIndex.value,
            children: screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: selectedIndex.value,
                onTap: (index) => selectedIndex.value = index,
                selectedItemColor: AppColors.green,
                unselectedItemColor: const Color.fromARGB(255, 129, 129, 129),
                selectedLabelStyle: const TextStyle(
                  fontFamily: Fonts.gilroyMedium,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: Fonts.gilroyRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                items: [
                  buildNavItem(
                    selectedIconPath: Assets.homeActive,
                    unselectedIconPath: Assets.home,
                    label: 'Baş Sahypa',
                    index: 0,
                  ),
                  buildNavItem(
                    selectedIconPath: Assets.gozlegActive,
                    unselectedIconPath: Assets.gozleg,
                    label: 'Gözleg',
                    index: 1,
                  ),
                  buildNavItem(
                    selectedIconPath: Assets.sebetActive,
                    unselectedIconPath: Assets.sebet,
                    label: 'Sebet',
                    index: 2,
                  ),
                  buildNavItem(
                    selectedIconPath: Assets.tassyklaActive,
                    unselectedIconPath: Assets.tassykla,
                    label: 'Tassyklananlar',
                    index: 3,
                  ),
                  buildNavItem(
                    selectedIconPath: Assets.userActive,
                    unselectedIconPath: Assets.user,
                    label: 'Profil',
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

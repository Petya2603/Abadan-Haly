import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.back,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 52.0 : 16.0,
            vertical: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Assets.logo,
                  height: isTablet ? 102 : 60,
                  width: 166,
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),
              Text("Habarlaşmak üçin",
                  style: TextStyle(
                      fontSize: isTablet ? 24 : 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: Fonts.gilroySemiBold,
                      color: AppColors.green)),
              const SizedBox(height: 18),
              contactCard(
                icon: SvgPicture.asset(
                  Assets.location,
                ),
                title: "Bizin salgymyz",
                subtitle:
                    "Türkmenistan, Aşgabat şäheri, Abadan Etrap, Altyn Asyr köçesi, jaý 27",
                isTablet: isTablet,
              ),
              contactCard(
                icon: SvgPicture.asset(
                  Assets.email,
                ),
                title: "Email",
                subtitle: "info@naduaashgabat.com.tm",
                isTablet: isTablet,
              ),
              contactCard(
                icon: SvgPicture.asset(
                  Assets.call,
                ),
                title: "Telefon belgimiz",
                subtitle: "+993-12-39-90-06",
                isTablet: isTablet,
              ),
              contactCard(
                icon: SvgPicture.asset(
                  Assets.fax,
                ),
                title: "FAX",
                subtitle: "39-90-05",
                isTablet: isTablet,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget contactCard({
    required Widget icon,
    required String title,
    required String subtitle,
    bool isTablet = false,
  }) {
    return Container(
      height: isTablet ? 144 : 100,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 244, 244, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: isTablet ? 24 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Fonts.gilroySemiBold,
                    fontSize: isTablet ? 16 : 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: const Color.fromRGBO(111, 110, 110, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

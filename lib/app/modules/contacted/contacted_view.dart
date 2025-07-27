import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haly/app/modules/contacted/widgets/contact_card.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';
import 'package:haly/app/widgets/custom_app_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
              ContactCard(
                icon: SvgPicture.asset(
                  Assets.location,
                ),
                title: "Bizin salgymyz",
                subtitle:
                    "Türkmenistan, Aşgabat şäheri, Abadan Etrap, Altyn Asyr köçesi, jaý 27",
                isTablet: isTablet,
              ),
              ContactCard(
                icon: SvgPicture.asset(
                  Assets.email,
                ),
                title: "Email",
                subtitle: "info@naduaashgabat.com.tm",
                isTablet: isTablet,
              ),
              ContactCard(
                icon: SvgPicture.asset(
                  Assets.call,
                ),
                title: "Telefon belgimiz",
                subtitle: "+993-12-39-90-06",
                isTablet: isTablet,
              ),
              ContactCard(
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
}
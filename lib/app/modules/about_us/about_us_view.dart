import 'package:flutter/material.dart';
import 'package:haly/app/modules/about_us/widgets/about_us_header.dart';
import 'package:haly/app/modules/about_us/widgets/about_us_images.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/widgets/custom_app_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 20.0 : 16.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutUsHeader(isTablet: isTablet),
                Text(
                  "Iň soňky täzelenen senesi: [Senesi]\n"
                  "[Şereketiňiziň Ady] ('biz,' 'bize,' ýa-da 'biziň') müşderilerimiziň gizlinligini goramaga berk boýun bolýar. Bu Gizlinlik Syýasaty, internet sahypamyza [Web sahypanyň URL-sini goýuň] gireniňizde ýa-da platformamyz arkaly söwda eden wagtyňyz maglumatlaryňyzy nädip ýygnap, ulanýandygymyzy we gorap saklaýandygymyzy düşündirýär. Şu syýasaty üns bilen okaň, sebäbi şahsy maglumatlaryňyzyň nähili ulanyljagyny bilmek size peýdalydyr",
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: Fonts.gilroyRegular,
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                AboutUsImages(isTablet: isTablet),
                SizedBox(height: isTablet ? 24 : 16),
                Text(
                  "1. Ýygnanýan Maglumatlarymyz\n"
                  "Biz siziň maglumatyňyzy aşakdaky usullar bilen ýygnap bilýäris:Şahsy Maglumatlar: Hasap döredenizde, satyn alma edenizde ýa-da müşderi hyzmaty bilen habarlaşanyňyzda bize berýän adyňyz, e-poçta salgynyz, telefon belgiňiz, hasap we iberiş salgyňyz.Töleg Maglumatlary: Töleg we bank maglumatlary üçünji tarap töleg işläp taýýarlaýjylar tarapyndan dolandyrylýar. Biz bu duýgur maglumatlary gönüden-göni saklamaýarys ýa-da dolandyrmaýarys.Ulanyş Maglumaty: IP salgylary, brauzer görnüşleri, enjam görnüşleri we sahypamyz bilen interaksiýaňyz ýaly maglumatlar.Cookies we Yzarlama Tehnologiýalary: Sahypamyzyň işini gowulandyrmak, traffigi analiz etmek we tejribäňizi uýgunlaşdyrmak üçin cookies we şuňa meňzeş tehnologiýalary ulanýarys.",
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: Fonts.gilroyRegular,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

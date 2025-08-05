import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haly/app/modules/about_us/controller.dart';
import 'package:haly/app/modules/about_us/widgets/about_us_header.dart';
import 'package:haly/app/modules/about_us/widgets/about_us_images.dart';
import 'package:haly/app/widgets/custom_app_bar.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import '../../theme/theme/app_theme.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({super.key});
  final AboutController controller = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GetX<AboutController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child:
                        Lottie.asset('assets/images/processing-circle.json')));
          }

          if (controller.hasError.value) {
            return LayoutBuilder(
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
                      const AboutUsHeader(),
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
            );
          }

          if (controller.about.value == null) {
            return LayoutBuilder(
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
                      const AboutUsHeader(),
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
            );
          }

          return _buildContentView(context, controller);
        },
      ),
    );
  }

  Widget _buildContentView(BuildContext context, AboutController controller) {
    final aboutData = controller.about.value!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AboutUsHeader(),
              Html(
                data: aboutData.title,
                style: {
                  "body": Style(
                    // fontSize: FontSize(26),
                    // fontWeight: FontWeight.bold,
                    // margin: Margins.zero,
                    // padding: HtmlPaddings.zero,
                  ),
                },
              ),
              const SizedBox(height: 24),
              if (aboutData.images.isNotEmpty)
                _AboutImagesSlider(
                  imagePaths: aboutData.images,
                ),
              const SizedBox(height: 16),
              Html(
                data: aboutData.description,
                style: {
                  "body": Style(
                    // fontSize: FontSize(16),
                    // fontWeight: FontWeight.w400,
                    // fontFamily: Fonts.gilroyRegular,
                    // margin: Margins.zero,
                    // padding: HtmlPaddings.zero,
                  ),
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AboutImagesSlider extends StatelessWidget {
  final List<String> imagePaths;

  const _AboutImagesSlider({
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 283;

    final double cardWidth = MediaQuery.of(context).size.width * 0.45;

    return SizedBox(
      height: imageHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: imagePaths.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        itemBuilder: (context, index) {
          final imagePath = imagePaths[index];
          final imageFile = File(imagePath);

          return SizedBox(
            width: cardWidth,
            child: Card(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: imageFile.existsSync()
                  ? Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      child: Image.asset(Assets.about1, fit: BoxFit.cover),
                    ),
            ),
          );
        },
      ),
    );
  }
}

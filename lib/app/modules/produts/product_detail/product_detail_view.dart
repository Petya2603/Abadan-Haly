import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/data/carpet_model.dart';
import 'package:haly/app/modules/produts/product_detail/product_image_screen.dart';
import 'package:haly/app/modules/produts/product_detail/widgets/product_detail_appbar.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  ProductDetailView({super.key, required this.product});
  final RxString selectedColorName = ''.obs;
  final RxString selectedColorHex = ''.obs;
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailAppbar(),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.4,
              child: PageView.builder(
                itemCount: product.figures.length,
                itemBuilder: (context, index) {
                  final figure = product.figures[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageZoomScreen(
                            imagePath: figure.image,
                            productCode: product.code,
                            productName: product.category.name,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 807,
                            width: double.infinity,
                            child: Image.file(
                              File(figure.image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// Then modify your Row widget like this:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            product.category.name,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              fontFamily: Fonts.gilroySemiBold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.code,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 110, 110, 112),
                              fontFamily: Fonts.gilroyBold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() => Text(
                                selectedColorName.value.isNotEmpty
                                    ? selectedColorName.value
                                    : product.figures.first.colors.first.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 110, 110, 112),
                                  fontFamily: Fonts.gilroyBold,
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Reňkler:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: Fonts.gilroySemiBold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: product.figures
                                .expand((figure) => figure.colors)
                                .map((color) => GestureDetector(
                                      onTap: () {
                                        selectedColorName.value = color.name;
                                        selectedColorHex.value = color.hexCode;
                                      },
                                      child: Obx(() => Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(int.parse(color
                                                  .hexCode
                                                  .replaceAll('#', '0xFF'))),
                                              borderRadius:
                                                  BorderRadius.circular(54),
                                              border: Border.all(
                                                color: selectedColorHex.value ==
                                                        color.hexCode
                                                    ? AppColors.green
                                                    : AppColors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                          )),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Geometrik şekli',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: Fonts.gilroySemiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: product.figures
                        .map((figure) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(239, 244, 254, 1),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                figure.name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: Fonts.gilroySemiBold,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Standart ölçegler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.gilroySemiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: product.figures
                        .expand((figure) => figure.sizes)
                        .map((size) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(239, 244, 254, 1),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                '${size.width}x${size.height} ${size.measurementUnit}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: Fonts.gilroySemiBold,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 247, 247),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sargamak isleýän halyňyzyň öçlegini elde hem girizip bilersiňiz!',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: Fonts.gilroySemiBold,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 0, 147, 61),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFE0E0E0)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: TextField(
                                              controller: _widthController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                hintText: 'Ini (sm)',
                                                hintStyle: TextStyle(
                                                    color: Color(0xFF9E9E9E)),
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFE0E0E0)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: TextField(
                                              controller: _lengthController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                hintText: 'Uzynlygy (sm)',
                                                hintStyle: TextStyle(
                                                    color: Color(0xFF9E9E9E)),
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: Fonts.gilroyRegular,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Attributes
                  const Text(
                    'Attributes:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: Fonts.gilroySemiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...product.attributes.map((attr) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${attr.name}: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: Fonts.gilroyMedium,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                attr.value,
                                style: const TextStyle(
                                    fontFamily: Fonts.gilroyRegular),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),

                  // Figures (Shapes)
                  const Text(
                    'Shapes:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.gilroySemiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: product.figures
                        .map((figure) => Column(
                              children: [
                                Image.file(
                                  File(figure.image),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                Text(figure.name),
                              ],
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // Colors

                  const SizedBox(height: 24),

                  // Sizes
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

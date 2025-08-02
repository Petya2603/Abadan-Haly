import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haly/app/data/carpet_model.dart';
import 'package:haly/app/modules/produts/controllers/product_detail_controller.dart';
import 'package:haly/app/modules/produts/view/product_image_screen.dart';
import 'package:haly/app/widgets/custom_detail_appbar.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  ProductDetailView({super.key, required this.product});

  late final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    final ProductDetailController controller =
        Get.put(ProductDetailController(product: product));
    return Scaffold(
      appBar: const ProductDetailAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 246, 246, 248),
              height: Get.height * 0.4,
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.updatePageIndex(index);
                },
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
                      child: Image.file(
                        File(figure.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (product.figures.length > 1)
              SizedBox(
                height: 102,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.figures.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    final figure = product.figures[index];
                    return GestureDetector(
                      onTap: () {
                        controller.updatePageIndex(index);
                      },
                      child: Obx(
                        () => Container(
                          width: 102,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: controller.selectedIndex.value == index
                                  ? const Color.fromARGB(255, 102, 102, 102)
                                  : const Color.fromARGB(255, 231, 231, 231),
                              width: controller.selectedIndex.value == index
                                  ? 2.5
                                  : 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.file(
                              File(figure.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.category.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.gilroySemiBold,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.chevron_right,
                            color: Color.fromARGB(255, 245, 245, 245)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF4CAF50)),
                        ),
                        child: const Text(
                          "Dekor",
                          style: TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.gilroySemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  controller.selectedColorName.value.isNotEmpty
                                      ? controller.selectedColorName.value
                                      : (product
                                              .figures[controller
                                                  .selectedFigureIndex.value]
                                              .colors
                                              .isNotEmpty
                                          ? product
                                              .figures[controller
                                                  .selectedFigureIndex.value]
                                              .colors
                                              .first
                                              .name
                                          : ''),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 110, 110, 112),
                                    fontFamily: Fonts.gilroyBold,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Obx(
                            () => Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: product
                                  .figures[controller.selectedFigureIndex.value]
                                  .colors
                                  .map((color) => GestureDetector(
                                        onTap: () {
                                          controller.selectColor(color);
                                        },
                                        child: Obx(() {
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(int.parse(color
                                                  .hexCode
                                                  .replaceAll('#', '0xFF'))),
                                              borderRadius:
                                                  BorderRadius.circular(54),
                                              border: Border.all(
                                                color: controller
                                                            .selectedColorHex
                                                            .value ==
                                                        color.hexCode
                                                    ? AppColors.green
                                                    : Colors.transparent,
                                                width: controller
                                                            .selectedColorHex
                                                            .value ==
                                                        color.hexCode
                                                    ? 3.0
                                                    : 0,
                                              ),
                                            ),
                                          );
                                        }),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.decrementQuantity();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 224, 224, 224),
                                width: 1),
                          ),
                          child:
                              const Icon(Icons.remove, color: AppColors.grey),
                        ),
                      ),
                      Obx(
                        () => SizedBox(
                          width: 60,
                          child: Text(
                            '${controller.quantity.value}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: Fonts.gilroySemiBold,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.incrementQuantity();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.add, color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Geometrik şekli',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: Fonts.gilroySemiBold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: product.figures.asMap().entries.map((entry) {
                        int index = entry.key;
                        Figure figure = entry.value;
                        return GestureDetector(
                          onTap: () {
                            controller.selectFigure(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color:
                                  controller.selectedFigureIndex.value == index
                                      ? AppColors.green
                                      : const Color.fromRGBO(239, 244, 254, 1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              figure.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: Fonts.gilroySemiBold,
                                  fontWeight: FontWeight.w600,
                                  color: controller.selectedFigureIndex.value ==
                                          index
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Standart ölçegler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.gilroySemiBold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: product
                          .figures[controller.selectedFigureIndex.value].sizes
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key;
                        Size size = entry.value;
                        return GestureDetector(
                          onTap: () {
                            controller.selectSize(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: controller.selectedSizeIndex.value == index
                                  ? AppColors.green
                                  : const Color.fromRGBO(239, 244, 254, 1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              '${size.width}x${size.height} ${size.measurementUnit}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: Fonts.gilroySemiBold,
                                  fontWeight: FontWeight.w600,
                                  color: controller.selectedSizeIndex.value ==
                                          index
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
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
                          const Text(
                            'Ölçegi elde girizmek',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: Fonts.gilroySemiBold,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 39, 39, 39),
                            ),
                          ),
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
                                              color: const Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: TextField(
                                          controller:
                                              controller.widthController,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            hintText: 'Ini (sm)',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF9E9E9E)),
                                          ),
                                          style: const TextStyle(fontSize: 16),
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
                                              color: const Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: TextField(
                                          controller:
                                              controller.lengthController,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            hintText: 'Uzynlygy (sm)',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF9E9E9E)),
                                          ),
                                          style: const TextStyle(fontSize: 16),
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
                    ),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 110, 110, 112),
                      fontWeight: FontWeight.w400,
                      fontFamily: Fonts.gilroyRegular,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(2.5),
                      1: FlexColumnWidth(2.5),
                    },
                    border: TableBorder.all(
                      color: const Color(0xFFE7E7E7),
                      width: 1,
                    ),
                    children: product.attributes.map((attr) {
                      return TableRow(
                        children: [
                          Container(
                            color: const Color.fromARGB(255, 247, 250, 252),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                attr.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: Fonts.gilroyRegular,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              attr.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: Fonts.gilroyRegular,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.addProductToCart();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.boxalt,
                            colorFilter: const ColorFilter.mode(
                                AppColors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Sebede goş',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: Fonts.gilroySemiBold,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

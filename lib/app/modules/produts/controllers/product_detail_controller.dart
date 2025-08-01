import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haly/app/data/carpet_model.dart';

class ProductDetailController extends GetxController {
  final Product product;

  ProductDetailController({required this.product});

  // State variables
  final RxInt selectedIndex = 0.obs; // For PageView image selection
  final RxInt quantity = 1.obs;
  final RxInt selectedFigureIndex = 0.obs;
  final RxInt selectedSizeIndex = (-1).obs; // -1 means no size selected

  final RxString selectedColorName = ''.obs;
  final RxString selectedColorHex = ''.obs;

  late TextEditingController widthController;
  late TextEditingController lengthController;
  late PageController pageController; // Add PageController

  @override
  void onInit() {
    super.onInit();
    widthController = TextEditingController();
    lengthController = TextEditingController();
    pageController = PageController(initialPage: selectedIndex.value); // Initialize PageController

    // Initialize selected color based on the first figure's first color
    if (product.figures.isNotEmpty && product.figures.first.colors.isNotEmpty) {
      selectedColorName.value = product.figures.first.colors.first.name;
      selectedColorHex.value = product.figures.first.colors.first.hexCode;
    }
  }

  @override
  void onClose() {
    widthController.dispose();
    lengthController.dispose();
    pageController.dispose(); // Dispose PageController
    super.onClose();
  }

  void updatePageIndex(int index) {
    selectedIndex.value = index;
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void selectFigure(int index) {
    selectedFigureIndex.value = index;
    selectedSizeIndex.value = -1; // Reset selected size when figure changes

    // Update selected color based on the newly selected figure's first color
    if (product.figures[index].colors.isNotEmpty) {
      selectedColorName.value = product.figures[index].colors.first.name;
      selectedColorHex.value = product.figures[index].colors.first.hexCode;
    } else {
      selectedColorName.value = '';
      selectedColorHex.value = '';
    }
  }

  void selectSize(int index) {
    selectedSizeIndex.value = index;
  }

  void selectColor(CarpetColor color) {
    selectedColorName.value = color.name;
    selectedColorHex.value = color.hexCode;
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haly/app/data/carpet_model.dart';
import 'package:haly/app/data/cart_item_model.dart'; // Import CartItem
import 'package:haly/app/modules/cart/cart_controller.dart';
import 'package:haly/app/modules/cart/cart_view.dart'; // Import CartController

class ProductDetailController extends GetxController {
  final Product product;

  ProductDetailController({required this.product});

  final RxInt selectedIndex = 0.obs;
  final RxInt quantity = 1.obs;
  final RxInt selectedFigureIndex = 0.obs;
  final RxInt selectedSizeIndex = (-1).obs;

  final RxString selectedColorName = ''.obs;
  final RxString selectedColorHex = ''.obs;

  late TextEditingController widthController;
  late TextEditingController lengthController;
  late PageController pageController;

  final CartController _cartController =
      Get.find<CartController>(); // Get CartController instance

  @override
  void onInit() {
    super.onInit();
    widthController = TextEditingController();
    lengthController = TextEditingController();
    pageController = PageController(initialPage: selectedIndex.value);

    if (product.figures.isNotEmpty && product.figures.first.colors.isNotEmpty) {
      selectedColorName.value = product.figures.first.colors.first.name;
      selectedColorHex.value = product.figures.first.colors.first.hexCode;
    } else if (product.figures.isNotEmpty) {
      selectedColorName.value = '';
      selectedColorHex.value = '';
    }
  }

  @override
  void onClose() {
    widthController.dispose();
    lengthController.dispose();
    pageController.dispose();
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
    selectedSizeIndex.value = -1;

    if (product.figures.isNotEmpty &&
        product.figures[index].colors.isNotEmpty) {
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

  void addProductToCart() {
    // Ensure selectedFigureIndex is within bounds
    if (selectedFigureIndex.value < 0 ||
        selectedFigureIndex.value >= product.figures.length) {
      Get.snackbar(
        'Hata',
        'Lütfen bir ürün figürü seçiniz!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    final selectedFigure = product.figures[selectedFigureIndex.value];

    // Color selection validation
    CarpetColor? selectedColor;
    if (selectedFigure.colors.isNotEmpty) {
      if (selectedColorHex.value.isEmpty) {
        Get.snackbar(
          'Hata',
          'Lütfen bir renk seçiniz!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      selectedColor = selectedFigure.colors
          .firstWhereOrNull((c) => c.hexCode == selectedColorHex.value);
      if (selectedColor == null) {
        Get.snackbar(
          'Hata',
          'Seçilen renk bulunamadı!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
    }

    // Size selection validation (standard or custom)
    Size? selectedSize;
    final customWidth = double.tryParse(widthController.text);
    final customLength = double.tryParse(lengthController.text);

    if (customWidth != null && customLength != null) {
      // Custom size entered
      selectedSize = Size(
          id: 0, // Custom sizes can have a default ID like 0 or a unique generated ID
          width: customWidth.toInt(),
          height: customLength.toInt(),
          measurementUnit: 'cm');
    } else if (selectedSizeIndex.value != -1 &&
        selectedSizeIndex.value < selectedFigure.sizes.length) {
      // Standard size selected
      selectedSize = selectedFigure.sizes[selectedSizeIndex.value];
    } else {
      // No size selected (neither custom nor standard)
      Get.snackbar(
        'Hata',
        'Lütfen bir ölçü seçiniz veya özel ölçü giriniz!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Create CartItem
    final cartItem = CartItem(
      imagePath: selectedFigure.image,
      name: product.category.name,
      code: product.code,
      color: selectedColor,
      shape: selectedFigure,
      size: selectedSize,
      quantity: quantity.value,
    );

    // Add to cart and navigate
    _cartController.addToCart(cartItem);
    Get.to(() => CartView());
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haly/app/data/carpet_model.dart';
import 'package:haly/app/data/cart_item_model.dart';
import 'package:haly/app/modules/cart/cart_controller.dart';
import 'package:hugeicons/hugeicons.dart';

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

  final CartController _cartController = Get.find<CartController>();

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
    if (selectedFigureIndex.value < 0 ||
        selectedFigureIndex.value >= product.figures.length) {
      Get.snackbar(
        'Ýalňyşlyk',
        "Gemetrik şekili saýlaň!",
        icon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedAlertCircle,
            size: 28,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return;
    }
    final selectedFigure = product.figures[selectedFigureIndex.value];

    CarpetColor? selectedColor;
    if (selectedFigure.colors.isNotEmpty) {
      if (selectedColorHex.value.isEmpty) {
        Get.snackbar(
          'Ýalňyşlyk',
          "Haly reňkini saýlaň",
          icon: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedAlertCircle,
              size: 28,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red.shade600,
          colorText: Colors.white,
          borderRadius: 12,
          margin: const EdgeInsets.all(15),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        return;
      }
      selectedColor = selectedFigure.colors
          .firstWhereOrNull((c) => c.hexCode == selectedColorHex.value);
      if (selectedColor == null) {
        Get.snackbar(
          'Ýalňyşlyk',
          "Saýlanan reňk tapylmady!",
          icon: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedAlertCircle,
              size: 28,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red.shade600,
          colorText: Colors.white,
          borderRadius: 12,
          margin: const EdgeInsets.all(15),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        return;
      }
    }

    Size? selectedSize;
    final customWidth = double.tryParse(widthController.text);
    final customLength = double.tryParse(lengthController.text);

    if (customWidth != null && customLength != null) {
      selectedSize = Size(
          id: 0,
          width: customWidth.toInt(),
          height: customLength.toInt(),
          measurementUnit: 'cm');
    } else if (selectedSizeIndex.value != -1 &&
        selectedSizeIndex.value < selectedFigure.sizes.length) {
      selectedSize = selectedFigure.sizes[selectedSizeIndex.value];
    } else {
      Get.snackbar(
        'Ýalňyşlyk',
        "Standart ölçegi saýlaň ýa-da ölçegi elde giriziň!",
        icon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedAlertCircle,
            size: 28,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      return;
    }

    final cartItem = CartItem(
      imagePath: selectedFigure.image,
      name: product.category.name,
      code: product.code,
      color: selectedColor,
      shape: selectedFigure,
      size: selectedSize,
      quantity: quantity.value,
    );

    _cartController.addToCart(cartItem);
    // Get.to(() => CartView());
  }
}

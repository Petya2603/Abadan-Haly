import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haly/app/data/carpet_model.dart';
import 'package:haly/app/data/cart_item_model.dart';
import 'package:haly/app/data/data_service.dart';
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
  final RxString selectedColorImage = ''.obs;

  late TextEditingController widthController;
  late TextEditingController lengthController;
  late PageController pageController;

  late final CartController _cartController;
  final DataService _dataService = DataService();
  final RxList<Product> filteredProducts = <Product>[].obs;
  final RxList<Product> filteredProductskopsatylan = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    widthController = TextEditingController();
    lengthController = TextEditingController();
    pageController = PageController(initialPage: selectedIndex.value);
    _cartController = Get.find<CartController>();

    if (product.figures.isNotEmpty && product.figures.first.colors.isNotEmpty) {
      selectedColorName.value = product.figures.first.colors.first.name;
      selectedColorHex.value = product.figures.first.colors.first.hexCode;
      selectedColorImage.value = product.figures.first.colors.first.image;
    } else if (product.figures.isNotEmpty) {
      selectedColorName.value = '';
      selectedColorHex.value = '';
      selectedColorImage.value = product.figures.first.image;
    }
    _loadFilteredProducts();
    loadFilteredProductskopsatylan();
  }

  void _loadFilteredProducts() async {
    final carpetData = await _dataService.getCarpetData();
    final allProducts = carpetData.products;
    filteredProducts.value = allProducts
        .where((p) =>
            p.category.name == product.category.name && p.code != product.code)
        .toList();
  }

  void loadFilteredProductskopsatylan() async {
    final carpetData = await _dataService.getCarpetData();
    final allProducts = carpetData.products;
    final category = carpetData.categories
        .firstWhereOrNull((c) => c.id == product.category.id);

    if (category != null) {
      final topSellingIds = category.topSellingProductsIds;

      if (topSellingIds != null && topSellingIds.isNotEmpty) {
        filteredProductskopsatylan.value =
            allProducts.where((p) => topSellingIds.contains(p.id)).toList();
      } else {
        filteredProductskopsatylan.value = [];
      }
    } else {
      filteredProductskopsatylan.value = [];
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
    // When the page view changes, update the selected color details
    final currentFigure = product.figures[selectedFigureIndex.value];
    if (index < currentFigure.colors.length) {
      final color = currentFigure.colors[index];
      selectedColorName.value = color.name;
      selectedColorHex.value = color.hexCode;
      selectedColorImage.value = color.image;
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
      selectedColorImage.value = product.figures[index].colors.first.image;
    } else {
      selectedColorName.value = '';
      selectedColorHex.value = '';
      selectedColorImage.value = product.figures[index].image;
    }
  }

  void selectSize(int index) {
    selectedSizeIndex.value = index;
    final selectedFigure = product.figures[selectedFigureIndex.value];
    if (index >= 0 && index < selectedFigure.sizes.length) {
      final size = selectedFigure.sizes[index];
      widthController.text = size.width.toString();
      lengthController.text = size.height.toString();
    }
  }

  void selectColor(CarpetColor color) {
    selectedColorName.value = color.name;
    selectedColorHex.value = color.hexCode;
    selectedColorImage.value = color.image;

    final currentFigureColors =
        product.figures[selectedFigureIndex.value].colors;
    final colorIndex = currentFigureColors.indexOf(color);
    if (colorIndex != -1 && pageController.hasClients) {
      pageController.jumpToPage(colorIndex);
    }
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
        "Ölçegi giriziň!",
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
      product: product,
      quantity: quantity.value,
      colorName: selectedColor?.name ?? '',
      size:
          '${selectedSize.width}x${selectedSize.height} ${selectedSize.measurementUnit}',
      imageUrl: selectedColorImage.value,
    );

    _cartController.addToCart(cartItem);
  }

  CartItem getCartItem() {
    final selectedFigure = product.figures[selectedFigureIndex.value];
    final selectedColor = selectedFigure.colors
        .firstWhereOrNull((c) => c.hexCode == selectedColorHex.value);

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
    }

    return CartItem(
      product: product,
      quantity: quantity.value,
      colorName: selectedColor?.name ?? '',
      size:
          '${selectedSize?.width ?? ''}x${selectedSize?.height ?? ''} ${selectedSize?.measurementUnit ?? ''}',
      imageUrl: selectedColorImage.value,
    );
  }
}

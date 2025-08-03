import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haly/app/data/cart_item_model.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class AddToCartDialog extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onConfirm;

  const AddToCartDialog({
    super.key,
    required this.cartItem,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Daha yumuşak kenarlar
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Tema rengini kullanır
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildProductInfo(),
                  const SizedBox(height: 24.0),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Tassyklama',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              fontFamily: Fonts.gilroyBold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '"${cartItem.product.category.name}" harydyny sebede goşmak isleýärsiňizmi?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: Fonts.gilroySemiBold,
                color: Theme.of(context).textTheme.titleSmall?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.file(
            File(cartItem.product.figures.first.colors.first.image),
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              _buildInfoRow(
                  Icons.shopping_bag_outlined, 'Mukdary: ${cartItem.quantity}'),
              const SizedBox(height: 12.0),
              _buildInfoRow(
                  Icons.color_lens_outlined, 'Reňki: ${cartItem.colorName}'),
              const SizedBox(height: 12.0),
              _buildInfoRow(
                  Icons.aspect_ratio_outlined, 'Ölçegi: ${cartItem.size}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.grey, size: 20),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            fontFamily: Fonts.gilroyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              side: BorderSide(color: AppColors.grey.withOpacity(0.5)),
            ),
            child: const Text(
              'Ýok',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 16,
                fontFamily: Fonts.gilroySemiBold,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: AppColors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 5, // Düğmeye derinlik hissi verir
              shadowColor: AppColors.green.withOpacity(0.4),
            ),
            child: const Text(
              'Hawa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: Fonts.gilroySemiBold,
              ),
            ),
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

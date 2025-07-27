import 'package:flutter/material.dart';
import 'package:haly/app/produts/theme/app_theme.dart';
import 'package:haly/app/produts/theme/theme_colors.dart';
import 'package:haly/app/widgets/custom_app_bar_logo.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      {
        "name": "Güneş",
        "code": "9122",
        "size": "5×7",
        "color": "Krem",
        "shape": "Gönüburçly",
        "image": "assets/images/category_product1.jpg"
      },
      {
        "name": "Nusaý",
        "code": "9122",
        "size": "5×7",
        "color": "Krem",
        "shape": "Yolluk",
        "image": "assets/images/category_product2.jpg"
      },
    ];

    return Scaffold(
      appBar: customAppBar(),
      body: ListView.builder(
        itemCount: cartItems.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Container(
            height: 394,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: Image.asset(
                        item["image"]!,
                        width: 230,
                        height: 329,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item["name"]!,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.gilroySemiBold)),
                          const SizedBox(height: 5),
                          Text("Kody: ${item["code"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fonts.gilroyMedium)),
                          const SizedBox(height: 5),
                          Text("Ölçegi : ${item["size"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fonts.gilroyMedium)),
                          const SizedBox(height: 5),
                          Text("Rengi :   ${item["color"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fonts.gilroyMedium)),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Text("Geometriki şekli",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.gilroyMedium)),
                              const SizedBox(width: 10),
                              Chip(
                                label: Text(item["shape"]!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: Fonts.gilroyMedium)),
                                backgroundColor:
                                    const Color.fromARGB(255, 239, 244, 254),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _quantityButton(Icons.remove),
                              const SizedBox(width: 12),
                              const Text("1",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: Fonts.gilroySemiBold)),
                              const SizedBox(width: 12),
                              _quantityButton(Icons.add, isAdd: true),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Tassyklamak",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: Fonts.gilroySemiBold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, {bool isAdd = false}) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: isAdd ? Colors.green : Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: isAdd ? Colors.white : Colors.black, size: 18),
    );
  }
}

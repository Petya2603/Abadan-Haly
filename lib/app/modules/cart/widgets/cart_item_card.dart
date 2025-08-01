import 'package:flutter/material.dart';
import 'package:haly/app/modules/cart/widgets/quantity_button.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, String> item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
                            style: TextStyle(
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
                    const Row(
                      children: [
                        QuantityButton(Icons.remove),
                        SizedBox(width: 12),
                        Text("1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: Fonts.gilroySemiBold)),
                        SizedBox(width: 12),
                        QuantityButton(Icons.add, isAdd: true),
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
  }
}

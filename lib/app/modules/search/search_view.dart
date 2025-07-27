import 'package:flutter/material.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
      {
        'title': 'Güneş',
        'code': '9122',
        'color': 'KREM',
        'image': 'assets/images/category_product1.jpg',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.logo,
                      height: 60,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),

              // Search field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 215, 215, 215)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText:
                        'Gözleg (halynyň adyny, reňkini we koduny gözledip bilersiňiz)',
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 102, 102, 102),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.gilroyRegular),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      title: product['title']!,
                      code: product['code']!,
                      color: product['color']!,
                      imagePath: product['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String code;
  final String color;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.title,
    required this.code,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(code, style: const TextStyle(fontSize: 14)),
                Text(color,
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: const Text('Görmek'),
            ),
          ),
        ],
      ),
    );
  }
}

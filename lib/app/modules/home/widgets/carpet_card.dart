import 'package:flutter/material.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

class CarpetCard extends StatelessWidget {
  final String title;
  final Gradient gradient;
  final String image;
  final bool isTablet;
  final VoidCallback? onTap;

  const CarpetCard({
    Key? key,
    required this.title,
    required this.gradient,
    required this.image,
    this.isTablet = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 272,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: gradient,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isTablet ? 48 : 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.gilroyBold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: -10,
                child: Image.asset(
                  image,
                  width: isTablet ? 200 : 120,
                  height: isTablet ? 200 : 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

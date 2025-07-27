import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haly/app/modules/onboarding/views/splash_view.dart';
import 'package:haly/app/produts/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Fonts.gilroyRegular,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      title: 'Abadan Haly',
      home: SplashScreen(),
    );
  }
}
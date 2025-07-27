import 'package:flutter/material.dart';
import 'package:haly/app/modules/home/home_view.dart';
import 'package:haly/app/modules/search/search_view.dart';

class AppColors {
  static const Color green = Color.fromRGBO(0, 147, 61, 1);

  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Color.fromRGBO(36, 35, 35, 1);
  static const Color background = Color.fromARGB(255, 226, 231, 253);
  static const Color success = Color.fromARGB(255, 12, 147, 19);
}

final List<Widget> screens = [
  HomeView(),
  SearchView(),
  HomeView(),
  HomeView(),
  HomeView(),
];

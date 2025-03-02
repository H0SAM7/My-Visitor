import 'package:flutter/material.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/features/ML/presentation/views/ml_view.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';

abstract class AppRoutes {
  //     BottomNavigator
  // BottomNavigator.id: (context) => const BottomNavigator(),
  static String? initialRoute = ScanView.id;
  static Map<String, Widget Function(BuildContext)> routes = {
    BottomNavigator.id: (context) => const BottomNavigator(),
    //navigation bar #########
    HomeView.id: (context) => const HomeView(),
    MLView.id: (context) => const MLView(),
        ScanView.id: (context) => const ScanView(),

  };
}

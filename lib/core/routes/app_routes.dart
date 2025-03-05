import 'package:flutter/material.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/register_view.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';

abstract class AppRoutes {
  //     BottomNavigator
  // BottomNavigator.id: (context) => const BottomNavigator(),
  static String? initialRoute = LoginView.id;
  static Map<String, Widget Function(BuildContext)> routes = {
    BottomNavigator.id: (context) => const BottomNavigator(),
    //navigation bar #########
    HomeView.id: (context) => const HomeView(),
        ScanView.id: (context) => const ScanView(),
                RegisterView.id: (context) => const RegisterView(),
        LoginView.id: (context) => const LoginView(),


  };
}

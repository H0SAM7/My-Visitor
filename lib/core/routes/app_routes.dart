
import 'package:flutter/material.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';

abstract class AppRoutes {
  //     BottomNavigator
  static String? initialRoute = HomeView.id;
  static Map<String, Widget Function(BuildContext)> routes = {
    //navigation bar #########
  HomeView.id: (context) => const HomeView(),


  };
}

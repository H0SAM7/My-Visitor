import 'package:flutter/material.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
import 'package:my_visitor/features/auth/views/forget_view.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/register_view.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/book_view.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotel_details_view.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotels_view.dart';
import 'package:my_visitor/features/splash/views/splash_screen.dart';
import 'package:my_visitor/temp/screen.dart';

abstract class AppRoutes {
  //     BottomNavigator
  // BottomNavigator.id: (context) => const BottomNavigator(),
  static String? initialRoute = HotelsView.id;
  static Map<String, Widget Function(BuildContext)> routes = {
    BottomNavigator.id: (context) => const BottomNavigator(),
    //navigation bar #########
    HomeView.id: (context) => const HomeView(),
    ScanView.id: (context) => const ScanView(),
    RegisterView.id: (context) => const RegisterView(),
    LoginView.id: (context) => const LoginView(),
    screenTSt.id: (context) => const screenTSt(),
    ForgetView.id: (context) => const ForgetView(),
    SplashScreen1.id: (context) => const SplashScreen1(),
    HotelsView.id: (context) => const HotelsView(),
          BookView.id: (context) => const BookView(),


  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
 
      case HotelDetailsView.id:
        final properties  = settings.arguments as Properties ;
        return MaterialPageRoute(
          builder: (context) => HotelDetailsView(hotel: properties),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          ),
        );
    }
  }
}

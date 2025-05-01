import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/features/ML/presentation/views/detection_view.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
import 'package:my_visitor/features/Notifications/services/send_notifications_view.dart';
import 'package:my_visitor/features/Notifications/views/notifi_view.dart';
import 'package:my_visitor/features/auth/views/forget_view.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/register_view.dart';
import 'package:my_visitor/features/chat/presentation/views/chat_view.dart';
import 'package:my_visitor/features/chat/presentation/views/contacts_view.dart';
import 'package:my_visitor/features/chatbot/screens/chat_screen.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/book_confirmation.dart';
import 'package:my_visitor/features/hotels/presentation/views/book_view.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotel_details_view.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotels_view.dart';
import 'package:my_visitor/features/landmarks/presentation/views/landmarks_view.dart';
import 'package:my_visitor/features/maps/map_view.dart';
import 'package:my_visitor/features/payment/paymob/presentation/manager/cubit/pay_mob_cubit.dart';
import 'package:my_visitor/features/settings/views/about_view.dart';
import 'package:my_visitor/features/settings/views/booking_info.dart';
import 'package:my_visitor/features/settings/views/faqs_view.dart';
import 'package:my_visitor/features/settings/views/privacy_view.dart';
import 'package:my_visitor/features/settings/views/sections/edit_profile_view.dart';
import 'package:my_visitor/features/settings/views/settings_view.dart';
import 'package:my_visitor/features/settings/views/sections/personal_info_view.dart';
import 'package:my_visitor/features/resturants/presentation/views/resturants_view.dart';
import 'package:my_visitor/features/translation/translation_view.dart';
import 'package:my_visitor/temp/screen.dart';

import '../../features/splash/onboarding_view.dart';
import '../../features/splash/splash_view.dart';

abstract class AppRoutes {
  //     BottomNavigator
  // BottomNavigator.id: (context) => const BottomNavigator(),
  static String? initialRoute = SplashView.id;
  static Map<String, Widget Function(BuildContext)> routes = {
    BottomNavigator.id: (context) => const BottomNavigator(),
    //navigation bar #########
    HomeView.id: (context) => const HomeView(),
    ScanView.id: (context) => const ScanView(),
    RegisterView.id: (context) => const RegisterView(),
    LoginView.id: (context) => const LoginView(),
    screenTSt.id: (context) => const screenTSt(),
    ForgetView.id: (context) => const ForgetView(),
    OnboardingView.id: (context) => const OnboardingView(),
    SplashView.id: (context) => const SplashView(),
    HotelsView.id: (context) => const HotelsView(),
    ResturantsView.id: (context) => const ResturantsView(),
    DetectionView.id: (context) => DetectionView(),
    LandmarksView.id: (context) => LandmarksView(),
    ChatbotScreen.id: (context) => ChatbotScreen(),
    TranslationView.id: (context) => TranslationView(),
    ContactsScreen.id: (context) => ContactsScreen(),
    SettingsView.id: (context) => SettingsView(),
    PersonalInfoView.id: (context) => PersonalInfoView(),
    EditProfileView.id: (context) => EditProfileView(),
    SendNotifactionsSendView.id: (context) => SendNotifactionsSendView(),
    FaqsView.id: (context) => FaqsView(),
    PrivacyPolicyView.id: (context) => PrivacyPolicyView(),
    AboutView.id: (context) => AboutView(),
    BookingInfoView.id: (context) => BookingInfoView(),
    NotifiView.id: (context) => NotifiView(),

    ChatView.id: (context) => ChatView(
          contactEmail: 'hoadel2003@gmail.com',
        ),
  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HotelDetailsView.id:
        final properties = settings.arguments as Properties;
        return MaterialPageRoute(
          builder: (context) => HotelDetailsView(hotel: properties),
        );
      case BookConfirmation.id:
        final args = settings.arguments as Map<String, dynamic>;
        final bookOrder = args['hotelBookModel'] as HotelBookModel;
        final properties = args['properties'] as Properties;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PayMobCubit(),
            child: BookConfirmation(
              hotelBookModel: bookOrder,
              hotel: properties,
            ),
          ),
        );
      case BookHotelView.id:
        final properties = settings.arguments as Properties;
        return MaterialPageRoute(
          builder: (context) => BookHotelView(hotel: properties),
        );
      case MapView.id:
        final args = settings.arguments as Map<String, dynamic>;
        final destinationLat = args['destinationLat'] as double;
        final destinationLng = args['destinationLng'] as double;
        return MaterialPageRoute(
          builder: (context) => MapView(
            latitude: destinationLat,
            longitude: destinationLng,
          ),
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

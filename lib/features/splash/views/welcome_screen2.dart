import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/splash/views/welcome_screen3.dart'
    show SplashScreen4;
import 'package:my_visitor/features/splash/views/widgets/custom_splash_screen.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplashScreen(
      backgroundImage: Assets.imagesBackground,
      mainImage: Assets.imagesTotankhamon,
      title: "Experience the Magic of\n Modern Egypt",
      description:
          'Discover the vibrant culture, cuisine, and\n nightlife of  Egypts cites ',
      buttonText: 'Next',
      buttonColor: const Color.fromARGB(255, 253, 105, 0),
      buttonFontColor: Colors.white,
      onNext: () {
        // الانتقال إلى الشاشة التالية
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SplashScreen4(), // استبدله بالشاشة التالية
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/splash/views/welcome_screen2.dart';
import 'package:my_visitor/features/splash/views/widgets/custom_splash_screen.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplashScreen(
      backgroundImage: Assets.imagesBackground,
      mainImage: Assets.imagesAnubis,
      title: "Discover the Wonders\nOf Ancient Egypt",
      description: "Explore the pyramids, temples, and\nthe tombs of pharaoh",
      buttonText: 'Next',
      buttonColor: const Color.fromARGB(255, 253, 105, 0),
      buttonFontColor: Colors.white,
      onNext: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen3()),
        );
      },
    );
  }
}

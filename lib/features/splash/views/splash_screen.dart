import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'dart:async';

import 'package:my_visitor/features/splash/views/welcome_screen1.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});
  static String id = 'SplashScreen1';
  @override
  SplashScreen1State createState() => SplashScreen1State();
}

class SplashScreen1State extends State<SplashScreen1>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.8; // يبدأ بحجم أصغر قليلاً

  @override
  void initState() {
    super.initState();

    // تشغيل الأنيميشن بعد لحظة قصيرة
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.2;
      });
    });

    // الانتقال إلى الشاشة التالية بعد 3 ثوانٍ
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              Assets.imagesBackground,
              fit: BoxFit.cover,
            ),
          ),

          // اللوجو مع أنيميشن تدريجي
          Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _opacity,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.8, end: _scale),
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutExpo,
                builder: (context, double scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Image.asset(
                  Assets.imagesLogo,
                  width: screenWidth * 0.9, // حجم مرن للوجو
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

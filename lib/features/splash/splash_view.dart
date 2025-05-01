import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/splash/onboarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'SplashView';
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        AnimationRoutes.flipHorizontalRoute(
          OnboardingView(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesLogo,
            ),
            const SizedBox(height: 20),
            // const Text(
            //   'My App',
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 20),
            LoadingWidgets.loadingCircles(size:60 ,),
          ],
        ),
      ),
    );
  }
}

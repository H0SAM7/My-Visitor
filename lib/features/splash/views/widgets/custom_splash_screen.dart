import 'package:flutter/material.dart';
import 'package:my_visitor/features/splash/views/widgets/custom_button.dart';

class CustomSplashScreen extends StatelessWidget {
  final String backgroundImage;
  final String mainImage;
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final Color buttonFontColor;
  final VoidCallback onNext;

  const CustomSplashScreen({
    super.key,
    required this.backgroundImage,
    required this.mainImage,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonFontColor,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: screenHeight * 0.5,
              child: Center(
                child: Image.asset(
                  mainImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 253, 105, 0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onNext: onNext,
              buttonText: buttonText,
              buttonColor: buttonColor,
              buttonFontColor: buttonFontColor,
            ),
          ]),
        ],
      ),
    );
  }
}

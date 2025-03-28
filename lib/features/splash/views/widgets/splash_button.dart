import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({
    super.key,
    required this.onNext,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonFontColor,
  });

  final VoidCallback onNext;
  final String buttonText;
  final Color buttonColor;
  final Color buttonFontColor;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return SizedBox(
      width: screenWidth * 0.8,
      height: screenHeight * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onNext,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            color: buttonFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

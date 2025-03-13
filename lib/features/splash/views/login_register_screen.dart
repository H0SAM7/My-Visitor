import 'package:flutter/material.dart';
import 'package:my_visitor/features/splash/views/widgets/custom_button.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.6,
            child: Image.asset(
              'assets/egyption_cat.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
                onNext: () {},
                buttonText: 'Login',
                buttonColor: const Color.fromARGB(255, 253, 105, 0),
                buttonFontColor: Colors.white),
          ),
          const SizedBox(height: 10),
          CustomButton(
              onNext: () {},
              buttonText: "Register",
              buttonColor: Colors.white,
              buttonFontColor: Colors.black),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Continue as a guest",
              style: TextStyle(
                fontSize: 16,
                color: Colors.cyan,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/splash/views/widgets/custom_button.dart';

class SplashScreen4 extends StatelessWidget {
  const SplashScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // الصورة العلوية (الفرعون والخلفية)
          SizedBox(
            height: screenHeight * 0.45,
            width: double.infinity,
            child: Image.asset(
              Assets.imagesPharaoh, // استبدله بالصورة المناسبة
              fit: BoxFit.cover,
            ),
          ),

          // القسم السفلي مع الخلفية المزخرفة
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      Assets.imagesBackground), // استبدله بالخلفية المناسبة
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // العنوان الرئيسي
                  Text(
                    "Embark on an Egyptian\n Adventure",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 253, 105, 0),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // الوصف
                  Text(
                    "Explore the Rich History culture and\n Natural Beauty of Egypt",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),
                  CustomButton(
                      buttonColor: const Color.fromARGB(255, 253, 105, 0),
                      buttonFontColor: Colors.white,
                      onNext: () {
                        // الانتقال إلى الشاشة التالية
                        Navigator.pushNamed(context, LoginView.id);
                      },
                      buttonText: "Start the journey")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

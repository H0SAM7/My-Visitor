import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ResetPassSuccView extends StatelessWidget {
  const ResetPassSuccView({super.key});
static String id='ResetPassSuccView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        //  CustomBack(title: 'Reset Password',),
          Text('Password Reset Successfully',style: AppStyles.style22White(context).copyWith(color: moveColor),),
        //  Image.asset(Assets.imagesResetPassSuccessful),
          const SizedBox(height: 20),
          //CustomButton(title: 'Login')
        ],
      ),
    );
  }
}
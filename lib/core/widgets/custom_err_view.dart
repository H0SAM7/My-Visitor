import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';

class CustomErrView extends StatelessWidget {
  const CustomErrView({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesErr,
          fit: BoxFit.cover,
        ),
        Text(errMessage,style: AppStyles.style32(context, Colors.white),),
      ],
    );
  }
}

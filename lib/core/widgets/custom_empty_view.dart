import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';

class CustomEmptyView extends StatelessWidget {
  const CustomEmptyView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesNodataCuate,
          fit: BoxFit.cover,
        ),
        Text(text,style: AppStyles.style32(context, Colors.white),),
      ],
    );
  }
}

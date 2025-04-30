
import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.widget, this.onTap});
  final String title;
  final Widget? widget;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          GestureDetector(
              onTap:onTap?? () {
                Navigator.pop(context);
              },
              child: Image.asset(Assets.iconsBack)),
          const SizedBox(width: 20),
          Text(title,style: AppStyles.style18(context),),
          const Spacer(),
          widget ?? const SizedBox()
        ],
      ),
    );
  }
}

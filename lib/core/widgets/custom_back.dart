import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/is_ar.dart';

// ignore: must_be_immutable
class CustomBack extends StatelessWidget {
  CustomBack({super.key, this.onPressed});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ??
          () {
            Navigator.pop(context);
          },
      child: Transform.rotate(
          angle: isArabic(context) ? 3.14159 : 0,
          child: Image.asset(
            Assets.iconsBack,
            color: Colors.white,
            height: 22.h,
          )),
    );
  }
}

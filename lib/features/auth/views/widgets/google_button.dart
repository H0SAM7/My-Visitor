import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/core/localization/generated/l10n.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(width: .7, color: orangeColor),
          borderRadius: BorderRadius.circular(10),
          //color: orangeColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.iconsGoogle,
                width: 35.w,
                height: 35.h,
              ),
                   SizedBox(width: 12.w),
              Text(
                textAlign: TextAlign.center,
                s.continueGoogle,
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

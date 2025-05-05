import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/is_ar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.widget, this.onTap, this.color});
  final String? title;
  final Widget? widget;
 final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isAr = isArabic(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: Transform.rotate(
                angle:isAr? 3.14159 :0,
                child: Image.asset(
                  Assets.iconsBack,
                  
                  color:color?? Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            title != null
                ? Text(
                    title!,
                    style: AppStyles.style18(context),
                  )
                : SizedBox(),
            const Spacer(),
            widget ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}

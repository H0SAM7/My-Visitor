import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting(
      {super.key,
      required this.title,
      this.leading,
      this.onTap,
      this.trailing});
  final String title;
  final Widget? leading;
  final Widget? trailing;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: AppStyles.style18(context),
        ),
        trailing: trailing ??
            Image.asset(
              Assets.iconsChevronRight,
              color: Colors.white,
              height: 20.h,
            ),
      ),
    );
  }
}

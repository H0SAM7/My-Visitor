import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';

class CustomDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? color;
  const CustomDrawerListTile(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, color: orangeColor),
        title: Text(
          title,
          style: TextStyle(color: orangeColor),
        ),
        trailing: trailing,
      ),
    );
  }
}

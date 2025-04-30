import 'package:flutter/material.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 71, 71, 71),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}

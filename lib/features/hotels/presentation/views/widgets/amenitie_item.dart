

import 'package:flutter/material.dart';

class AmenitieItem extends StatelessWidget {
  const AmenitieItem({
    super.key,
    required this.label,
  });

final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black54, // Dark background like in the image
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.wifi,
            color: Colors.white,
            size: 24,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

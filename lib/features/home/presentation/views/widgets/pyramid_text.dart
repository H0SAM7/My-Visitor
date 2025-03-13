import 'package:flutter/material.dart';

class PyramidText extends StatelessWidget {
  const PyramidText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The Great Pyramid of Giza",
            style: TextStyle(
              color: Color(0xffE09A1E),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Giza Necropolis",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

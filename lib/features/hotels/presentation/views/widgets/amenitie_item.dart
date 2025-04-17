import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/amenitie_display.dart';

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
          child: FaIcon(
            AmenityIconProvider()
                .getIcon(label), // Use FaIcon to render IconData
            size: 24,
            color: Colors.white, // White icon to match the theme
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


import 'package:flutter/material.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/amenitie_item.dart';

class AmenitieListView extends StatelessWidget {
  const AmenitieListView({
    super.key,
    required this.amenities,
  });

  final List<String> amenities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final amenity = amenities[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AmenitieItem(label: amenity),
        );
      },
    );
  }
}


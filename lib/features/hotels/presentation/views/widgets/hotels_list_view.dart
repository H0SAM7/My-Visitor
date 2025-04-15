import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotel_card.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({super.key, required this.hotelsList});
  final List<HotelModel> hotelsList;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final properties =
        hotelsList.expand((hotel) => hotel.properties!).toList();

    return GridView.builder(
        itemCount: properties.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth < 600 ? 2 : 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2 / 3.5, // Adjust based on card design
        ),
        itemBuilder: (context, index) {
          log('hotel lenght : ${properties[1]}');
          final hotel = properties[index];
        return  HotelCard(
            hotel: hotel,
          );
        });
  }
}

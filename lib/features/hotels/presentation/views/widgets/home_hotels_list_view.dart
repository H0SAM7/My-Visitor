import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotel_card.dart';

class HomeHotelsListView extends StatelessWidget {
  const HomeHotelsListView({super.key, required this.hotelsList});

  final List<HotelModel> hotelsList;

  @override
  Widget build(BuildContext context) {
    final properties = hotelsList.expand((hotel) => hotel.properties!).toList();

    return SizedBox(
      height: 250, // Adjust height to fit your card design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: properties.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final hotel = properties[index];
          log('Hotel: ${hotel.name}'); // Optional debug log
          
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: HotelCard(hotel: hotel),
          );
        },
      ),
    );
  }
}

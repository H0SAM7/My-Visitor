import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotels_view.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotel_home_card.dart';

class HomeHotelsListView extends StatelessWidget {
  const HomeHotelsListView({super.key, required this.hotelsList});

  final List<HotelModel> hotelsList;

  @override
  Widget build(BuildContext context) {
    final properties =
        hotelsList.expand((hotel) => hotel.properties!).toList().sublist(2);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: properties.length + 1,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        if (index == properties.length) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 100,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HotelsView.id);
                },
                child: Text(
                  'See All',
                  style: TextStyle(color: orangeColor),
                ),
              ),
            ),
          );
        }

        final hotel = properties[index];

        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(width: 200, child: HotelHomeCard(hotel: hotel)),
        );
      },
    );
  }
}

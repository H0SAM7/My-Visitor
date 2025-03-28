

import 'package:flutter/material.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotel_card.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      itemCount: 10, // Change based on available hotels
      //            SliverGridDelegateWithFixedCrossAxisCount
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth < 600
            ? 2
            : 3, // 1 column on small screens, 2 on larger screens
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2/3.5, // Adjust based on card design
      ),
      itemBuilder: (context, index) => const HotelCard(),
    );
  }
}

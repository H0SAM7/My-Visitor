import 'package:flutter/material.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotels_list_view.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});
  static String id = 'HotelsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          // SizedBox(
          //   height: 250, // Set a finite height
          //   child: HotelCard(),
          // ),
          SizedBox(height: 20),
          //   HotelCard(),
          Expanded(
            child: HotelListView(),
          )
        ],
      ),
    );
  }
}

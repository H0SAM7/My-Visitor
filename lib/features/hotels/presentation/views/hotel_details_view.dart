import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/core/widgets/image_slider.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/amenitie_listview.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotels_actions.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/review_and_price_sec.dart';

class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({super.key, required this.hotel});
  static const String id = 'HotelDetailsView';
  final Properties hotel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBack(),
          
        ),
        title: Text(hotel.name!),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(
                imageList:
                    hotel.images!.map((image) => image.originalImage!).toList(),
                size: size),
            SizedBox(
              height: 30,
            ),
            CustomTitleHeader(title: hotel.name.toString()),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                ),
                Text(
                  'Hotel in Heliopolis, Cairo ',
                  style: AppStyles.style16Gray(
                    context,
                  ),
                ),
              ],
            ),
            ReviewAndPriceSection(hotel: hotel),
            SizedBox(
              height: 15,
            ),
            CustomTitleHeader(title: 'Description'),
            SizedBox(
              height: 15,
            ),
            Text(
              hotel.description.toString(),
              style: AppStyles.style16Gray(
                context,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTitleHeader(
              title: 'Amenities',
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 70.h,
                child: AmenitieListView(amenities: hotel.amenities!)),
            SizedBox(
              height: 15,
            ),
      

            HotelsActions(hotel: hotel),
          ],
        ),
      ),
    );
  }
}

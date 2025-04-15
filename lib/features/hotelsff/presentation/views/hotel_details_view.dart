import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/core/widgets/image_slider.dart';
import 'package:my_visitor/features/auth/views/widgets/custom_send_button.dart';
import 'package:my_visitor/features/hotelsff/presentation/views/widgets/amenitie_item.dart';
import 'package:my_visitor/features/hotelsff/presentation/views/widgets/amenitie_listiew.dart';
import 'package:my_visitor/features/splash/views/widgets/splash_button.dart';

class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({super.key});
  static String id = 'HotelDetailsView';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    List<String> imageList = [
      Assets.imagesHotelTSt,
      Assets.imagesEgyptionCat,
      Assets.imagesHotelTSt,
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(imageList: imageList, size: size),
            SizedBox(
              height: 30,
            ),
            CustomTitleHeader(title: 'Serenity Haven Resort, Cairo'),
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
            SizedBox(
              height: 15,
            ),
            CustomTitleHeader(title: 'Description'),
            SizedBox(
              height: 15,
            ),
            Text(
              """A luxurious hotel in the heart of the city, featuring a modern design and rooms equipped with the latest amenities. It contains various restaurants, a fitness center, a spa, and a swimming pool. It provides an ideal environment to stay, whether for work or relaxation, with distinguished services and trained staff. ... Read more""",
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
            AmenitiesWidget(),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CustomButton(
                  title: 'title',
                  width: 170.w,
                  color: Color(0xff333333),
                ),
                CustomButton(
                  title: 'title',
                  width: 170.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AmenitiesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> amenities = [
    {'icon': Icons.air, 'label': 'AC'},
    {'icon': Icons.wifi, 'label': 'WI FI'},
    {'icon': Icons.local_laundry_service, 'label': 'Laundry'},
    {'icon': Icons.local_parking, 'label': 'Parking'},
    {'icon': Icons.local_bar, 'label': 'Cafe'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Adjust height as needed
      child: AmenitieListView(amenities: amenities),
    );
  }
}

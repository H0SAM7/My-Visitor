import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';

class ReviewAndPriceSection extends StatelessWidget {
  const ReviewAndPriceSection({
    super.key,
    required this.hotel,
  });

  final Properties hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          // Makes the row take only necessary space
          children: [
            Text(
              hotel.overallRating!.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4), 
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 24,
            ),
            SizedBox(width: 4), 
            Text(
              '(${hotel.reviews!}) Reviews',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Flexible(
          fit: FlexFit.tight,
          child: CustomButton(
            title: '${hotel.ratePerNight!.lowest ?? 200} Per Night ',
            width: 130.w,
          ),
        ),
      ],
    );
  }
}

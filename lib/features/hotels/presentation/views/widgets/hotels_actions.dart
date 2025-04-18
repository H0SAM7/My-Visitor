
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/book_view.dart';

class HotelsActions extends StatelessWidget {
  const HotelsActions({
    super.key,
    required this.hotel,
  });

  final Properties hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: 'Destination',
            width: 170.w,
            color: Color(0xff333333),
          ),
        ),
        Expanded(
          child: CustomButton(
            title: 'Book Now',
            width: 170.w,
            onTap: () {
         
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r)),
                  ),
                  builder: (context) {
                    return SizedBox(
                        height: 400.h,
                        child: BookHotelView(
                          hotel: hotel,
                        ));
                  });
            },
          ),
        ),
      ],
    );
  }
}

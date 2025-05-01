import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/styles/text_styles.dart';

import 'package:my_visitor/features/settings/views/widgets/booking_info_list_view.dart';

class BookingInfoView extends StatelessWidget {
  const BookingInfoView({super.key});
  static String id = 'BookingInfoView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Info',
          style: AppStyles.style22White(context),
        ),
        backgroundColor: Colors.transparent,
    //  foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: BookingInfoListView(),
          ),
        ],
      ),
    );
  }
}

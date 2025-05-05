import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/widgets/custom_app_bar.dart';

import 'package:my_visitor/features/settings/views/widgets/booking_info_list_view.dart';
import 'package:my_visitor/generated/l10n.dart';

class BookingInfoView extends StatelessWidget {
  const BookingInfoView({super.key});
  static String id = 'BookingInfoView';
  @override
  Widget build(BuildContext context) {
                            final s= S.of(context);

    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        children: [
          CustomAppBar(title:s.bookingInfo ,),
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

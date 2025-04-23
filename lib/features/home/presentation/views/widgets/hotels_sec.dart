import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/hotels_home_view.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotels_view.dart';

class HomeHotelsSection extends StatelessWidget {
  const HomeHotelsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitleHeader(title: 'Hotels Near You'),
              TextButton(
                child: Text(
                  'See All ',
                  style: AppStyles.style18(
                    context,
                  ).copyWith(color: orangeColor),
                ),
                onPressed: () {
                  Navigator.push(
                      context, AnimationRoutes.routeBottomLeft(HotelsView(),),);
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 290.h,
          child: HotelsHomeView(),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

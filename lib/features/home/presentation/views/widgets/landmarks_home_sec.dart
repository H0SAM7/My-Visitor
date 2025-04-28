import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/features/landmarks/presentation/views/widgets/landmarks_list_view.dart';

class LandmarksHomeSec extends StatelessWidget {
  const LandmarksHomeSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitleHeader(title: 'Popular Now'),
              TextButton(
                child: Text(
                  'See All ',
                  style: AppStyles.style18(
                    context,
                  ).copyWith(color: orangeColor),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   AnimationRoutes.routeBottomLeft(
                  //     ResturantsView(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 290.h,
          child: LandmarksListView(),
        ),
        Divider(),
      ],
    );
  }
}

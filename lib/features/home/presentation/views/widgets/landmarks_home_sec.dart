import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/features/landmarks/presentation/views/landmarks_view.dart';
import 'package:my_visitor/features/landmarks/presentation/views/widgets/landmarks_home_list_view.dart';import 'package:my_visitor/core/localization/generated/l10n.dart';

class LandmarksHomeSec extends StatelessWidget {
  const LandmarksHomeSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
                    final s= S.of(context);

    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitleHeader(title: s.Popular_Now),
              TextButton(
                child: Text(
                  s.seeAll,
                  style: AppStyles.style18(
                    context,
                  ).copyWith(color: orangeColor),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    AnimationRoutes.fancyZoomRotateFade(
                      LandmarksView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 290.h,
          child: LandmarksHomeListView(),
        ),
        Divider(),
      ],
    );
  }
}

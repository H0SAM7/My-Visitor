
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/features/resturants/presentation/views/resturants_view.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/home_resturants_list_view.dart';

class ResturantsHomeSec extends StatelessWidget {
  const ResturantsHomeSec({
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
              CustomTitleHeader(title: 'Restaurants Near You'),
                 TextButton(
                   child: Text(
                     'See All ',
                     style: AppStyles.style18(
                       context,
                     ).copyWith(color: orangeColor),
                   ),
                   onPressed: () {
                   Navigator.push(
                      context, AnimationRoutes.routeBottomLeft(ResturantsView(),),);
                   },
                 ),
            ],
          ),
        ),
                  SizedBox(
         height: 320.h,
         
         child: HomeResturantsListView()),
           Divider(),
      ],
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/utils/functions/url_luncher.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/features/resturants/presentation/views/resturants_details_view.dart';

class ResturantItem extends StatelessWidget {
  const ResturantItem({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive calculations
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            AnimationRoutes.routeBottomLeft(ResturantsDetailsView(
              restaurantModel: restaurantModel,
            )));
       
      },
      child: Card(
        color: const Color.fromARGB(19, 192, 180, 180),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                // borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
              ),
              child: CustomImage(
                borderRadius: 0,
                image: restaurantModel.squareImgUrl ??
                    'https://th.bing.com/th/id/R.26f677899cb906831538311cac52504e?rik=s0GOw2btDQt1tQ&pid=ImgRaw&r=0',
              ),
            ),
            // Responsive padding
            Padding(
              padding: EdgeInsets.all(8.w), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantModel.name ?? '',
                    style: AppStyles.style22White(context).copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    restaurantModel
                                .establishmentTypeAndCuisineTags?.isNotEmpty ==
                            true
                        ? restaurantModel.establishmentTypeAndCuisineTags!
                            .take(5)
                            .join(', ')
                        : 'No tags available',
                    style: AppStyles.style16Gray(context).copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star_border_outlined,
                          color: Colors.orange, size: 18.sp),
                      SizedBox(width: 4.w),
                      Flexible(
                        child: Text(
                          restaurantModel.averageRating.toString() ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(Icons.delivery_dining_outlined,
                          color: Colors.orange, size: 18.sp),
                      SizedBox(width: 4.w),
                      Flexible(
                        child: Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(Icons.access_time,
                          color: Colors.orange, size: 18.sp),
                      SizedBox(width: 4.w),
                      Flexible(
                        child: Text(
                          restaurantModel.currentOpenStatusText,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

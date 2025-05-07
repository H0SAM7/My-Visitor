import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/utils/functions/url_luncher.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/features/resturants/presentation/views/resturants_details_view.dart';

class HomeResturantCard extends StatelessWidget {
  const HomeResturantCard({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardHeight = screenWidth * 0.6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          // if (restaurantModel.hasMenu) {
          //   await launchUrlMethod(
          //       Uri.parse(restaurantModel.menuUrl.toString()));
         
          // }
          Navigator.push(
            context,
            AnimationRoutes.routeBottomLeft(ResturantsDetailsView(
              restaurantModel: restaurantModel,
            )));
          
        },
        child: SizedBox(
          width: double.infinity,
          height: cardHeight,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CustomImage(
                    borderRadius: 0,
                    image: restaurantModel.squareImgUrl ??
                        'https://th.bing.com/th/id/R.26f677899cb906831538311cac52504e?rik=s0GOw2btDQt1tQ&pid=ImgRaw&r=0',
                  ),
                ),
                // Gradient overlay for text readability
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
                // Text content at the bottom
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurantModel.name,
                          style: AppStyles.style22White(context).copyWith(fontSize: 16.sp)),
                      Text(
                        restaurantModel.reviewSnippets.reviewSnippetsList[1]
                                .reviewText ??
                            '',
                        style: AppStyles.style16Gray(context)
                      ),
                      SizedBox(height: cardHeight * 0.02),
                      Text(
                        restaurantModel.parentGeoName,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.cyanAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 7.h,
                    //  left: 5,
                    right: 10.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          '${restaurantModel.averageRating} (${restaurantModel.userReviewCount})',
                          style: AppStyles.style16Gray(context),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

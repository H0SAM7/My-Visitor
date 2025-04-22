import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotel_details_view.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key, required this.hotel});
  final Properties hotel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          HotelDetailsView.id,
          arguments: hotel,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                    child: CustomImage(image: hotel.images![0].originalImage!)
                    // Image.network(
                    //   hotel.images![0].originalImage!,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.05,
                  bottom: constraints.maxHeight * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (hotel.name!.length > 30
                            ? '${hotel.name!.substring(0, 25)}...'
                            : hotel.name!),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.style22White(
                          context,
                        ).copyWith(fontSize: 16),
                      ),
                      //                     AutoSizeText(
                      //   hotel.name.toString(),
                      //   style: AppStyles.style22White(context).copyWith(fontSize: 16),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   minFontSize: 14,
                      //   stepGranularity: 1,
                      //     softWrap: true,

                      // ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Text(
                        hotel.description!.length > 30
                            ? '${hotel.description!.substring(0, 28)}...'
                            : hotel.name!,
                        style: AppStyles.style16Gray(context),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: constraints.maxHeight * 0.05,
                    right: constraints.maxWidth * 0.05,
                    child: Image.asset(
                      Assets.iconsRightGoVector,
                      width: constraints.maxWidth * 0.12,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}

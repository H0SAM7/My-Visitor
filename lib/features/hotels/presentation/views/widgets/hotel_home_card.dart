import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotel_details_view.dart';

class HotelHomeCard extends StatelessWidget {
  const HotelHomeCard({super.key, required this.hotel});
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
                        (
                          hotel.name!.length > 20
                            ? '${hotel.name!.substring(0, 20)}...'
                            : hotel.name!),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.style22White(
                          context,
                        ).copyWith(fontSize: 16),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Text(
                         hotel.description!.length > 20
                            ? '${ hotel.description!.substring(0, 16)}...'
                            : hotel.name!
                       ,
                        style: AppStyles.style16Gray(context),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: RatingView(hotel: hotel),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
    required this.hotel,
  });

  final Properties hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${hotel.ratePerNight!.lowest} / night',
            style: AppStyles.style16Gray(context)),
        const SizedBox(width: 8),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(hotel.overallRating?.toStringAsFixed(1) ?? '4.5',
                style: AppStyles.style16Gray(context)),
          ],
        ),
      ],
    );
  }
}

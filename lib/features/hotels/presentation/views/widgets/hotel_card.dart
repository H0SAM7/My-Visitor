
import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/property.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key, required this.hotelproperties});
final Property hotelproperties;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                hotelproperties.images!.images[0].thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                     //   Colors.black.withOpacity(0.7),
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
                      hotelproperties.name.toString(),
                      style: AppStyles.style32(
                        context,
                        Colors.white,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Text(
                      hotelproperties.description.toString(),
                      style: AppStyles.style18(context),
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
    );
  }
}

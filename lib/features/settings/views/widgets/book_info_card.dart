import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/hotel_details_view.dart';

class BookInfoCard extends StatelessWidget {
  const BookInfoCard({
    super.key,
    required this.hotel,
    required this.hotelBookModel,
  });

  final Properties hotel;
  final HotelBookModel hotelBookModel;

  String formatDateRange(String checkIn, String checkOut) {
    final DateTime checkInDate = DateTime.parse(checkIn);
    final DateTime checkOutDate = DateTime.parse(checkOut);

    final dayIn = DateFormat('d').format(checkInDate);
    final dayOut = DateFormat('d').format(checkOutDate);
    final monthYear = DateFormat('MMM yyyy').format(checkOutDate);

    return '$dayIn - $dayOut $monthYear';
  }

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
      child: SizedBox(
        height: 160.h,
        child: Card(
          elevation: 0,
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.orange, width: .2),
          ),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: SizedBox.expand(
                    child: CustomImage(
                      image: hotel.images![0].originalImage!,
                      borderRadius: 0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              hotel.name!,
                              style: AppStyles.style18(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                hotel.overallRating.toString(),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        hotel.description ?? '',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.blue),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${hotel.ratePerNight!.lowest ?? 200} Per Night',
                        style: AppStyles.style18(context),
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              size: 18, color: orangeColor),
                          SizedBox(width: 8.w),
                          Text('Date', style: AppStyles.style18(context)),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Text(
                              formatDateRange(hotelBookModel.checkIn,
                                  hotelBookModel.checkOut),
                              style: AppStyles.style18(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person, size: 18, color: orangeColor),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              '${hotelBookModel.guest} Guests (${hotelBookModel.noRooms} Room)',
                              style: AppStyles.style18(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

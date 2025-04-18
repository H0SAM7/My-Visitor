import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';

class BookConfirmation extends StatelessWidget {
  const BookConfirmation(
      {super.key, required this.hotelBookModel, required this.hotel});
  static const String id = 'BookConfirmation';
  final HotelBookModel hotelBookModel;
  final Properties hotel;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
// Convert String to int for ratePerNight.lowest
    final int subtotal =
        hotelBookModel.noRooms * hotel.ratePerNight!.extractedLowest!.toInt();
    const double tax = 50.0; // Replace with dynamic value if available
    final double total = subtotal + tax;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Review Summary',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Card
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.network(
                        hotel.images![0].thumbnail!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Hotel Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotel.name!,
                            style: AppStyles.style22White(context)),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.location_pin,
                                color: Colors.grey, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Hotel in Heliopolis, Cairo',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4),
                            Text(
                              hotel.overallRating.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${hotel.ratePerNight!.lowest} per Night',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Booking Details
            _buildDetailRow('Booking Date', DateTime.now().toString()),
            const Divider(color: Colors.grey),
            _buildDetailRow('Check in', hotelBookModel.checkIn),
            const Divider(color: Colors.grey),
            _buildDetailRow('Check out', hotelBookModel.checkOut),
            const Divider(color: Colors.grey),
            _buildDetailRow('Guest', '${hotelBookModel.guest} Person'),
            const Divider(color: Colors.grey),
            _buildDetailRow('Room', hotelBookModel.noRooms.toString()),
            const Divider(color: Colors.grey),
            const SizedBox(height: 24),
            // Payment Details
            _buildDetailRow('Amount', '\$ ${subtotal * hotelBookModel.guest}',
                isBold: true),
            const Divider(color: Colors.grey),
            _buildDetailRow('Tax & Fees', '\$ $tax', isBold: true),
            const Divider(color: Colors.grey),
            _buildDetailRow('Total', '\$ $total', isBold: true),
            const SizedBox(height: 24),

            const SizedBox(height: 32),
            // Pay Now Button
            Center(
              child: CustomButton(
                title: 'Book Now',
                onTap: () async {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

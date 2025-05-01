import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/functions/save_hotel_payment.dart';
import 'package:my_visitor/core/widgets/custom_empty_view.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/settings/views/widgets/book_info_card.dart';

class BookingInfoListView extends StatelessWidget {
  const BookingInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchAllTransactionDetails,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAllTransactionDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LoadingWidgets.loadingthreeRotatingDots());
          }

          if (snapshot.hasError) {
            return CustomErrView(errMessage: 'Error loading booking history');
          }

          final transactions = snapshot.data ?? [];

          if (transactions.isEmpty) {
            return  Center(
              child: CustomEmptyView(text:  'No bookings found'),
            );
          }
 
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final hotel = transaction['hotel'] as Properties;
              final bookDetails = transaction['bookDetails'] as HotelBookModel;

              return Expanded(
                child: BookInfoCard(
                  hotelBookModel: bookDetails,
                  hotel: hotel,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

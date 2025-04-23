import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/functions/save_hotel_payment.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/core/widgets/custom_progress_hud.dart';
import 'package:my_visitor/core/widgets/show_custom_alert.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/payment/paymob/presentation/manager/cubit/pay_mob_cubit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BookConfirmation extends StatefulWidget {
  const BookConfirmation(
      {super.key, required this.hotelBookModel, required this.hotel});
  static const String id = 'BookConfirmation';
  final HotelBookModel hotelBookModel;
  final Properties hotel;

  @override
  State<BookConfirmation> createState() => _BookConfirmationState();
}

class _BookConfirmationState extends State<BookConfirmation> {
  bool isloading = false;
  void _handlePaymentSuccess(String orderId, String token) async {
    await Future.delayed(
      Duration(minutes: 2),
    );
    final result = await BlocProvider.of<PayMobCubit>(context)
        .updatePaymentStatus(orderId: orderId, token: token);
    log(result.toString());

    if (result.success && mounted) {
      await addTransactionDetailsToFirebase(
        orderId: orderId,
        result: result.toJson(),
        hotel: widget.hotel,
        hotelBookModel: widget.hotelBookModel,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final int subtotal = widget.hotelBookModel.noRooms *
        widget.hotel.ratePerNight!.extractedLowest!.toInt();
    const double tax = 50.0;
    final double total = subtotal + tax;

    return BlocListener<PayMobCubit, PayMobState>(
      listener: (context, state) {
        if (state is PaymobLoadingState) {
          setState(() {
            isloading = true;
          });
        }
        if (state is PaymobSuccessState) {
          _handlePaymentSuccess(state.orderId, state.token);
          if (mounted) {
            setState(() {
              isloading = false;
            });
          }

          showCustomAlert(
            context: context,
            type: AlertType.success,
            title: 'Successful process',
            description: '',
            closeFunction: () {
              Navigator.pushReplacementNamed(context, HomeView.id);
            },
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeView.id);
            },
            actionTitle: 'Ok',
          );
        }
      },
      child: AbsorbPointer(
        absorbing: isloading,
        child: CustomProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              // leading: IconButton(
              //   icon: const Icon(Icons.arrow_back, color: Colors.white),
              //   onPressed: () {},
              // ),
              title: const Text(
                'Review Summary',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                              widget.hotel.images![0].thumbnail!,
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
                              Text(widget.hotel.name!,
                                  style: AppStyles.style22White(context)),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.location_pin,
                                      color: Colors.grey, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Hotel in Heliopolis, Cairo',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    widget.hotel.overallRating.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${widget.hotel.ratePerNight!.lowest} per Night',
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
                  _buildDetailRow('Check in', widget.hotelBookModel.checkIn),
                  const Divider(color: Colors.grey),
                  _buildDetailRow('Check out', widget.hotelBookModel.checkOut),
                  const Divider(color: Colors.grey),
                  _buildDetailRow(
                      'Guest', '${widget.hotelBookModel.guest} Person'),
                  const Divider(color: Colors.grey),
                  _buildDetailRow(
                      'Room', widget.hotelBookModel.noRooms.toString()),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 24),
                  // Payment Details
                  _buildDetailRow(
                      'Amount', '\$ ${subtotal * widget.hotelBookModel.guest}',
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
                      onTap: () async {
                        await BlocProvider.of<PayMobCubit>(context)
                            .processPayment(total.toInt());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
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

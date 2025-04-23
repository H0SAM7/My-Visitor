import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';

Future<void> addTransactionDetailsToFirebase(
    {required String orderId,
    required Map<String, dynamic> result,
    required Properties hotel,
    required HotelBookModel hotelBookModel}) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth.User user = auth.FirebaseAuth.instance.currentUser!;
  await firestore
      .collection('users')
      .doc(user.email)
      .collection('booking_history')
      .doc(orderId) // Unique booking ID
      .set({
    'payment': result,
    'hotel': hotel.toJson(),
    'bookDetails': hotelBookModel.toJson(),
  });
}

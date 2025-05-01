
import 'dart:developer';

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
      .doc(orderId)
      .set({
    'payment': result,
    'hotel': hotel.toJson(),
    'bookDetails': hotelBookModel.toJson(),
  });
}


Future<List<Map<String, dynamic>>> fetchAllTransactionDetails() async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final auth.User? user = auth.FirebaseAuth.instance.currentUser;

    if (user == null) {
       return [];
    }

    final QuerySnapshot query = await firestore
        .collection('users')
        .doc(user.email)
        .collection('booking_history')
        .get();

    return query.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return {
        'orderId': doc.id,
        'payment': data['payment'] as Map<String, dynamic>,
        'hotel': Properties.fromJson(data['hotel'] as Map<String, dynamic>),
        'bookDetails': HotelBookModel.fromJson(data['bookDetails'] as Map<String, dynamic>),
      };
    }).toList();
  } catch (e) {
    log('Error fetching transaction details: $e');
    return [];
  }
}
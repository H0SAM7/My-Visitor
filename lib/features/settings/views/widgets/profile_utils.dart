import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_visitor/core/utils/shared_pref.dart';
import 'package:my_visitor/features/settings/views/sections/personal_info_view.dart';

class ProfileUtils {
  static Future<Map<String, dynamic>> getUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return {
        'username': AppConstants.defaultUsername,
        'email': AppConstants.defaultEmail,
        'phone': AppConstants.defaultPhone,
        'profileImageUrl': AppConstants.defaultProfileImage,
      };
    }

    try {
      // Check SharedPreferences
      String? jsonString = await SharedPreference().getString(user.email!);
      Map<String, dynamic> storedUserInfo = {};
      if (jsonString != null) {
        storedUserInfo = jsonDecode(jsonString);
      }

      // Check Firestore
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(user.email).get();
      if (doc.exists) {
        return {
          'username': doc.get('username') ?? storedUserInfo['username']?.toString() ?? user.displayName ?? AppConstants.defaultUsername,
          'email': user.email ?? AppConstants.defaultEmail,
          'phone': doc.get('phone') ?? storedUserInfo['phone']?.toString() ?? AppConstants.defaultPhone,
          'profileImageUrl': doc.get('profileImageUrl') ?? storedUserInfo['profileImageUrl']?.toString() ?? AppConstants.defaultProfileImage,
        };
      }

      // Fallback to SharedPreferences or defaults
      return {
        'username': storedUserInfo['username']?.toString() ?? user.displayName ?? AppConstants.defaultUsername,
        'email': user.email ?? AppConstants.defaultEmail,
        'phone': storedUserInfo['phone']?.toString() ?? AppConstants.defaultPhone,
        'profileImageUrl': storedUserInfo['profileImageUrl']?.toString() ?? AppConstants.defaultProfileImage,
      };
    } catch (e) {
      log('Error fetching profile: $e');
      return {
        'username': user.displayName ?? AppConstants.defaultUsername,
        'email': user.email ?? AppConstants.defaultEmail,
        'phone': AppConstants.defaultPhone,
        'profileImageUrl': AppConstants.defaultProfileImage,
      };
    }
  }
}
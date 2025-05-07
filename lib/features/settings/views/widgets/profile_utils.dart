import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_visitor/core/models/user_model.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/shared_pref.dart';


class AppConstants {
  static const String defaultUsername = 'User Name';
  static const String defaultEmail = 'User@gmail.com';
  static const String defaultPhone = 'Not Provided';
  static const String defaultProfileImage = Assets.imagesDefualtProfile;
}
class ProfileUtils {
  








  static final ProfileUtils _instance = ProfileUtils._internal();
  factory ProfileUtils() => _instance;
  ProfileUtils._internal();

  Future<UserModel?> loadUserData() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        log('No authenticated user found');
        throw Exception('User not authenticated');
      }

      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .get();

      if (doc.exists) {
        final userModel = UserModel.fromJson(doc.data() as Map<String, dynamic>);
        log('Loaded user data: ${doc.data().toString()}');
        return userModel;
      } else {
        log('User document does not exist for ${user.email}');
        return null;
      }
    } catch (e) {
      log('Error loading user data: $e');
      rethrow; 
    }
  }

  Future<UserModel?> refreshProfile() async {
    log('Refreshing profile data');
    return await loadUserData();
  }
Future<void> updateProfile(UserModel updatedModel) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        log('No authenticated user found');
        throw Exception('User not authenticated');
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .set(updatedModel.toJson());
      log('Profile updated successfully for ${user.email}');
    } catch (e) {
      log('Error updating profile: $e');
      rethrow;
    }
  }
}
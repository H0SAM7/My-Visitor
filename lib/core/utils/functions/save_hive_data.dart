import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

void saveHotelDataInHive(List<HotelModel> hotels) {
  log('Saving ${hotels.length} hotels to box: $kHotelsBox');
  var box = Hive.box<HotelModel>(kHotelsBox);
  box.addAll(hotels);
  log('Saved. Box now contains ${box.values.length} hotels');
}

void saveResturantsHive(List<RestaurantModel> resturants) {
  log('Saving ${resturants.length} hotels to box: $kResturantsBox');
  var box = Hive.box<RestaurantModel>(kResturantsBox);
  box.addAll(resturants);
  log('Saved. Box now contains ${box.values.length} hotels');
}
void saveLandmarksHive(LandmarkResponse landmarkResponse) {
  log('Saving $landmarkResponse hotels to box: $kResturantsBox');
  var box = Hive.box<LandmarkResponse>(kLandmarks);
  box.add(landmarkResponse);
  log('Saved. Box now contains ${box.values.length} hotels');
}

import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

abstract class LandmarkLocalDataSource {
  LandmarkResponse fetchLandmarks();
}
class LandmarkLocalDataSourceImpl extends LandmarkLocalDataSource {
  @override
  LandmarkResponse fetchLandmarks() {
    try {
      var box = Hive.box<LandmarkResponse>(kLandmarks);
      // Box.values returns an Iterable, not a single LandmarkResponse
      // Assuming you want the first item or need to handle multiple items
      LandmarkResponse? landmarkResponse = box.values.isNotEmpty 
          ? box.values.first 
          : LandmarkResponse(); // Return empty response or handle appropriately

      return landmarkResponse;
    } catch (e) {
      log('####################### Error fetching landmarks from Hive');
      log(e.toString());
      return LandmarkResponse(); // Return a default/empty response instead of empty return
    }
  }
  
  
}
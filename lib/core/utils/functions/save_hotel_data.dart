import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

void saveHotelDataInHive(List<HotelModel> hotels) {
  log('Saving ${hotels.length} hotels to box: $kHotelsBox');
  var box = Hive.box<HotelModel>(kHotelsBox);
  box.addAll(hotels);
  log('Saved. Box now contains ${box.values.length} hotels');
}

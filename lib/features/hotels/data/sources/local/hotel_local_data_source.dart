import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

abstract class HotelsLocalDataSource {
  List<HotelModel> fetchAllHotels();
}

class HotelLocalDataSourceImpl extends HotelsLocalDataSource {
  @override
  List<HotelModel> fetchAllHotels() {
    try {
      var box = Hive.box<HotelModel>(kHotelsBox);
      List<HotelModel> hotels = box.values.toList();
      log('HIvE Date #######################${hotels[0].properties![0].description.toString()} ');
      log('#######################  ${box.values.toString()}');
      return box.values.toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

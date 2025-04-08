import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';
import 'package:my_visitor/keys/hive_keys.dart';

abstract class HotelsLocalDataSource {
  List<HotelEntity> fetchAllHotels();
}

class HotelLocalDataSourceImpl extends HotelsLocalDataSource {
  @override
  List<HotelEntity> fetchAllHotels() {
    var box = Hive.box<HotelEntity>(kHotelsBox);
    return box.values.toList();
  }
}

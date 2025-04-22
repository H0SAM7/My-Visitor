import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

abstract class HotelsLocalDataSource {
  List<HotelModel> fetchAllHotels({int page, int pageSize});
}

class HotelLocalDataSourceImpl extends HotelsLocalDataSource {
  @override
  List<HotelModel> fetchAllHotels({int page = 0, int pageSize = 19}) {
    try {
      var box = Hive.box<HotelModel>(kHotelsBox);
      List<HotelModel> allHotels = box.values.toList();

      // Apply pagination
      final start = page * pageSize;
      final end = start + pageSize;

      if (start >= allHotels.length) return [];

      final paginatedHotels = allHotels.sublist(
        start,
        end > allHotels.length ? allHotels.length : end,
      );

      log('Fetched ${paginatedHotels.length} hotels from box (page $page)');
      return paginatedHotels;
    } catch (e) {
      log('#######################  err to fetch hotels from hive');
      log(e.toString());
      return [];
    }
  }
}

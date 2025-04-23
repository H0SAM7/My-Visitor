import 'dart:developer';
import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

abstract class ResturantsLocalDataSource {
  List<RestaurantModel> fetchAllResturants({int page, int pageSize});
}

class ResturantsLocalDataSourceImpl extends ResturantsLocalDataSource {
  @override
  List<RestaurantModel> fetchAllResturants({int page = 0, int pageSize = 15}) {
    try {
      var box = Hive.box<RestaurantModel>(kResturantsBox);
      List<RestaurantModel> allResturants = box.values.toList();

      // Apply pagination
      final start = page * pageSize;
      final end = start + pageSize;

      if (start >= allResturants.length) return [];

      final paginatedHotels = allResturants.sublist(
        start,
        end > allResturants.length ? allResturants.length : end,
      );

      log('Fetched ${paginatedHotels.length} Resturants from box (page $page)');
      return paginatedHotels;
    } catch (e) {
      log('#######################  err to fetch Resturants from hive');
      log(e.toString());
      return [];
    }
  }
}

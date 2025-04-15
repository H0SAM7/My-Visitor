import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/save_hotel_data.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';
import 'package:my_visitor/keys/hotels.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelModel>> fetchAllHotels();
}

class HotelRemoteDataSourceImpl extends HotelsRemoteDataSource {
  @override
  Future<List<HotelModel>> fetchAllHotels() async {
    var data = await ApiServices().getRequest(
      endPoint: hotelsBaseUrl,
      queryParameters: {'api_key': hotelsToken},
    );
    List<HotelModel> hotels = getHotelsList(data);
      saveHotelDataInHive(hotels, kHotelsBox);
    log(hotels.toString());
    log('Get Hotels Done');
    return hotels;
  }

List<HotelModel> getHotelsList(dynamic data) {
    try {
      // Check if data is a Map and contains the expected key
      if (data is Map<String, dynamic>) {
        // Adjust the key based on your API response structure
        // For SerpAPI, it might be 'properties' or another key
        final hotelList = data['properties'] as List<dynamic>? ?? [];
        final hotels = hotelList.map((e) => HotelModel.fromJson({'properties': [e]})).toList();
        log('Hotels parsed: ${hotels.length}');
        return hotels;
      } else {
        log('Unexpected data format: $data');
        return [];
      }
    } catch (e) {
      log('Error parsing hotels: $e');
      return [];
    }
  }
}
//Hotelsmodel.fromJson(e)).toList()

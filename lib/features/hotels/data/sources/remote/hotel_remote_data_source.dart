import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/core/utils/functions/save_hotel_data.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel.dart';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';
import 'package:my_visitor/keys/hive_keys.dart';
import 'package:my_visitor/keys/hotels.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelEntity>> fetchAllHotels();
}

class HotelRemoteDataSourceImpl extends HotelsRemoteDataSource {
  @override
  Future<List<HotelEntity>> fetchAllHotels() async {
    var data = await ApiServices().getRequest(
      endPoint: hotelsBaseUrl,
      queryParameters: {'api_key': hotelsToken},
    );
    List<HotelEntity> hotels = getHotelsList(data);
    saveHotelDataInHive(hotels,kHotelsBox);
    log(hotels.toString());
    log('Get Hotels Done');
    return hotels;
  }


  List<HotelEntity> getHotelsList(Map<String, dynamic> data) {
    List<HotelEntity> hotels = (data['properties'] as List)
        .map((hotel) => HotelModel.fromMap(hotel))
        .toList();
    return hotels;
  }
}

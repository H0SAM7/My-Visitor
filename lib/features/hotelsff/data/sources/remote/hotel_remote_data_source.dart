import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/save_hotel_data.dart';
import 'package:my_visitor/features/hotelsff/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotelsff/domain/entities/hotel_entity.dart';
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
    saveHotelDataInHive(hotels, kHotelsBox);
    log(hotels.toString());
    log('Get Hotels Done');
    return hotels;
  }

  List<HotelEntity> getHotelsList(Map<String, dynamic> data) {
    //  final hotels = (data as List)
    //       .map((hotel) => Hotelmodel.fromJson(hotel))
    //       ;
    final hotelModel = Hotelmodel.fromJson(data);
    log(hotelModel.toString());
    return hotelModel.properties
            ?.map((property) => HotelEntity(properties: [property]))
            .toList() ??
        [];
  }
}

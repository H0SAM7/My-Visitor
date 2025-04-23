import 'dart:developer';

import 'package:my_visitor/core/utils/functions/save_hive_data.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/keys/hotels.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelModel>> fetchAllHotels({String? nextPageToken});
}

class HotelRemoteDataSourceImpl extends HotelsRemoteDataSource {
  @override
  Future<List<HotelModel>> fetchAllHotels({String? nextPageToken}) async {
    String api =
        '&check_in_date=2025-04-31&check_out_date=2025-05-30&adults=2&currency=USD&gl=us&hl=en';
    String pagi = '&next_page_token=$nextPageToken';
    var data = await ApiServices().getRequest(
      endPoint: '$hotelsBaseUrl$api$pagi',
      queryParameters: {'api_key': hotelsToken},
    );
    List<HotelModel> hotels = getHotelsList(data);

    saveHotelDataInHive(
      hotels,
    );
    log('Get Hotels Done%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    log(hotels.length.toString());

    // log(hotels.toString());
    log('Get Hotels Done');
    return hotels;
  }

  List<HotelModel> getHotelsList(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        // Parse the entire response as a single HotelModel
        final hotelModel = HotelModel.fromJson(data);
        final hotels = hotelModel.properties?.map((property) {
              // Create a new HotelModel for each property, copying other metadata
              return HotelModel(
                searchMetadata: hotelModel.searchMetadata,
                searchParameters: hotelModel.searchParameters,
                searchInformation: hotelModel.searchInformation,
                brands: hotelModel.brands,
                properties: [property], // Wrap single property in a list
                serpapiPagination: hotelModel.serpapiPagination,
              );
            }).toList() ??
            [];
        log('Hotels parsed: ${hotels.length}');
        return hotels;
      } else {
        log('Unexpected data format: $data');
        return [];
      }
    } catch (e, stackTrace) {
      log('Error parsing hotels: $e', stackTrace: stackTrace);
      return [];
    }
  }
}
//Hotelsmodel.fromJson(e)).toList()

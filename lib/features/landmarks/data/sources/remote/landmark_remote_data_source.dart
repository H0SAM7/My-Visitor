import 'dart:developer';

import 'package:my_visitor/core/utils/functions/save_hive_data.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/keys/hotels.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class LandmarkRemoteDataSource {
  Future<LandmarkResponse> fetchLandmarks();
}

class LandmarkRemoteDataSourceImpl extends LandmarkRemoteDataSource {
  @override
  Future<LandmarkResponse> fetchLandmarks() async {
  
    var data = await ApiServices().getRequest(
      endPoint: '$hotelsBaseUrl',
      queryParameters: {'api_key': hotelsToken},
    );
        LandmarkResponse landmarkResponse = LandmarkResponse.fromJson(data);

    saveLandmarksHive(
      landmarkResponse,
    );
    log('Get Hotels Done%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    log(landmarkResponse.toString());

    // log(hotels.toString());
    log('Get Hotels Done');
    return landmarkResponse;
  }

}
//Hotelsmodel.fromJson(e)).toList()

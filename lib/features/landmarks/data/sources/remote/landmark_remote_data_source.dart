import 'dart:developer';
import 'package:my_visitor/core/utils/functions/save_hive_data.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/keys/hotels.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class LandmarkRemoteDataSource {
  Future<LandmarkResponse> fetchLandmarks({ int? pagiNum});
}

class LandmarkRemoteDataSourceImpl extends LandmarkRemoteDataSource {
  @override
  Future<LandmarkResponse> fetchLandmarks({ int? pagiNum}) async {

 
    var data = await ApiServices().getRequest(
      endPoint: landmarksApi,
      queryParameters: {'api_key': landmarkToken},
    );
    log("$landmarksApi&start=${pagiNum??20}");
        LandmarkResponse landmarkResponse = LandmarkResponse.fromJson(data);

    saveLandmarksHive(
      landmarkResponse,
    );
    log('Get landmarks Done%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    log(landmarkResponse.toString());

    log('Get landmarks Done');
    return landmarkResponse;
  }

}
//Hotelsmodel.fromJson(e)).toList()

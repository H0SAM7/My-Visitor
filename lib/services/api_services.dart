import 'package:dio/dio.dart';

class ApiServices {
  Future<Map<String, dynamic>> getRequest(
      {required String endPoint, queryParameters, Map<String, dynamic>? headers,}) async {
    Response response = await Dio().get(
      endPoint,
       options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await Dio().post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }
}

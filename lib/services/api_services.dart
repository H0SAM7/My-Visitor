import 'package:dio/dio.dart';

class ApiServices {
  Future<Map<String, dynamic>> getRequest(
      {required String endPoint,  queryParameters}) async {
    Response response = await Dio().get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}

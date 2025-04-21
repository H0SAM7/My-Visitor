import 'package:dio/dio.dart';

abstract class Failure {
  final String? errMessage;

  const Failure({this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timed out.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Request send timed out.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Response receive timed out.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'Request to API server was cancelled.');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'An unknown error occurred.');
      default:
        return ServerFailure(errMessage: 'An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          errMessage: response['error']['message'] ??
              response['message'] ??
              'Invalid request or authentication failed.');
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request was not found. Please try later!');
    } else if (statusCode == 422) {
      // Paymob-specific: Handling validation errors
      final errors = response['errors'] as Map<String, dynamic>?;
      if (errors != null && errors.isNotEmpty) {
        return ServerFailure(errMessage: errors.values.first.join(', '));
      }
      return ServerFailure(errMessage: 'Validation error occurred.');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server error. Please try later.');
    } else {
      return ServerFailure(
          errMessage: 'Oops! There was an error. Please try again.');
    }
  }
}

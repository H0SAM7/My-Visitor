part of 'image_detection_cubit.dart';

@immutable

abstract class DetectionState {}

class DetectionInitial extends DetectionState {}

class DetectionLoading extends DetectionState {}

class DetectionSuccess extends DetectionState {
  final int classNumber;
  final String result;

  DetectionSuccess({required this.classNumber, required this.result});
}









class GetDataLoading extends DetectionState {}



class UploadDataSuccess extends DetectionState {}
class GetDataSuccess extends DetectionState {
 final List<DetectionModel> data;

  GetDataSuccess({required this.data});
}
class GetDataFilure extends DetectionState {
  final String errMessage;

  GetDataFilure({required this.errMessage});
}

class DetectionError extends DetectionState {
  final String errMessage;

  DetectionError({required this.errMessage});
}
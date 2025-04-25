part of 'image_detection_cubit.dart';

@immutable
sealed class ImageDetectionState {}

final class ImageDetectionInitial extends ImageDetectionState {}
final class ImageDetectionLoading extends ImageDetectionState {}
final class ImageDetectionFailure extends ImageDetectionState {
  final String errmessage;

  ImageDetectionFailure({required this.errmessage});
}
final class ImageDetectionSuccess extends ImageDetectionState {
  final int classNum;

  ImageDetectionSuccess({required this.classNum});
}

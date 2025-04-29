part of 'landmark_cubit.dart';

@immutable
sealed class LandmarkState {}

final class LandmarkInitial extends LandmarkState {}

final class LandmarkLoading extends LandmarkState {}


final class LandmarkSuccess extends LandmarkState {
  final LandmarkResponse landmarkResponse;

  LandmarkSuccess({required this.landmarkResponse});
}

final class LandmarkFailure extends LandmarkState {
  final String errMessage;

  LandmarkFailure({required this.errMessage});
}





final class LandmarkPginationLoading extends LandmarkState {}

final class LandmarkPaginationFailure extends LandmarkState {
  final String errMessage;

  LandmarkPaginationFailure({required this.errMessage});
}

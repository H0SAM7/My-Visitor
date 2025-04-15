part of 'hotel_cubit.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelSuccess extends HotelState {
  final List<HotelModel> hotels;

  HotelSuccess({required this.hotels});
}

final class HotelFailure extends HotelState {
  final String errMessage;

  HotelFailure({required this.errMessage});
}

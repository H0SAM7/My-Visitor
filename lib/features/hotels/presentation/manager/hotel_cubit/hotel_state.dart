part of 'hotel_cubit.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelSuccess extends HotelState {
  final List<HotelEntity> hotels;

  HotelSuccess({required this.hotels});
}

final class HotelfFailure extends HotelState {
  final String errMessage;

  HotelfFailure({required this.errMessage});
}

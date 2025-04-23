part of 'resrurant_cubit.dart';

@immutable
sealed class RestrurantState {}

final class ResrurantInitial extends RestrurantState {}
final class ResrurantLoading extends RestrurantState {}

final class ResrurantSuccess extends RestrurantState {
  final List<RestaurantModel> restaurants;

  ResrurantSuccess({required this.restaurants});
}

final class ResrurantFailure extends RestrurantState {
  final String errMessage;

  ResrurantFailure({required this.errMessage});
  
}



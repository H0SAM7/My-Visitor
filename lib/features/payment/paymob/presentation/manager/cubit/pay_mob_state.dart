part of 'pay_mob_cubit.dart';

@immutable
sealed class PayMobState {}

class PayMobInitial extends PayMobState {}

class PaymobLoadingState extends PayMobState {}

class PaymobSuccessState extends PayMobState {}

class PaymobFailureState extends PayMobState {
  final String errorMessage;

  PaymobFailureState({required this.errorMessage});
}

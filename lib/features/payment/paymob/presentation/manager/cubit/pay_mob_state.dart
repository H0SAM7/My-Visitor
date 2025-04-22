part of 'pay_mob_cubit.dart';

@immutable
sealed class PayMobState {}

class PayMobInitial extends PayMobState {}

class PaymobLoadingState extends PayMobState {}

class PaymobSuccessState extends PayMobState {
  final String token;
  final String orderId;

  PaymobSuccessState({required this.token, required this.orderId});
}

class PaymobFailureState extends PayMobState {
  final String errorMessage;

  PaymobFailureState({required this.errorMessage});
}

class PaymobTransactionSuccess extends PayMobState {}

class PaymobTransactionloading extends PayMobState {}

class PaymobTransactionFailure extends PayMobState {
  final String errMessage;

  PaymobTransactionFailure({required this.errMessage});
}

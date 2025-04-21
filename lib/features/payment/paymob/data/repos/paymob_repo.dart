import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/dio_failures.dart';

abstract class PaymobRepo {
  Future<Either<Failure, String>> getAuthToken();
  Future<Either<Failure, int>> getOrderId({
    required String token,
    required int amount,
    required String currency,
  });
  Future<Either<Failure, String>> getPaymentKey({
    required String token,
    required int amount,
    required String currency,
    required int orderId,
  });
 // Future<Either<Failure, void>> payMobPay({required int amount});
}

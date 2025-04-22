import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_visitor/features/payment/paymob/data/models/transaction_model.dart';
import 'package:my_visitor/features/payment/paymob/data/repos/paymob_repo.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/payment/paymob/data/sources/paymob_remote_data_source.dart';
import 'package:my_visitor/services/api_services.dart';

class PaymobRepoImpl implements PaymobRepo {
  PaymobRepoImpl();

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    try {
      final result =
          await PaymobRemoteDataSourceImpl(apiServices: ApiServices())
              .getAuthToken();
      return right(result['token']);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getOrderId({
    required String token,
    required int amount,
    required String currency,
  }) async {
    try {
      final result =
          await PaymobRemoteDataSourceImpl(apiServices: ApiServices())
              .getOrderId(token: token, amount: amount, currency: currency);
      return right(result['id']);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getPaymentKey({
    required String token,
    required int amount,
    required String currency,
    required int orderId,
  }) async {
    try {
      final result =
          await PaymobRemoteDataSourceImpl(apiServices: ApiServices())
              .getPaymentKey(
                  token: token,
                  amount: amount,
                  currency: currency,
                  orderId: orderId);
      return right(result['token']);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaymobTransactionModel>> getTransactionStatus(
      {required String orderId, required String token}) async {
    try {
      final response =
          await PaymobRemoteDataSourceImpl(apiServices: ApiServices())
              .getTransactionStatus(token: token, orderId: orderId);
      return right(response);
    } catch (e) {
      log("getTransactionStatus ${e.toString()}");
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  // @override
  // Future<Either<dio.Failure, void>> payMobPay({required int amount}) async{
  //  final authToken = await getAuthToken();
  // final orderId = await getOrderId(
  //   token: authToken,
  //   amount: amount,
  //   currency: 'EGP',
  // );
  // final paymentKey = await getPaymentKey(
  //     token: authToken, amount: amount, currency: 'EGP', orderId: orderId);
  // }
}

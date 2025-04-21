import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_visitor/core/error/dio_failures.dart' as dio;
import 'package:my_visitor/features/payment/paymob/data/repos/paymob_repo.dart';
import 'dart:developer';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/payment/paymob/data/helper/api_keys.dart';
import 'package:my_visitor/features/payment/paymob/data/sources/paymob_remote_data_source.dart';
import 'package:my_visitor/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

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
              .getOrderId(token, amount, currency);
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
              .getPaymentKey(token, amount, currency, orderId);
      return right(result['token']);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
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

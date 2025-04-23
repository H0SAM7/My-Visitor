import 'dart:developer';
import 'package:my_visitor/features/payment/paymob/data/helper/apis.dart';
import 'package:my_visitor/features/payment/paymob/data/helper/paymob_constants.dart';
import 'package:my_visitor/features/payment/paymob/data/models/transaction_model.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class PaymobRemoteDataSource {
  Future<Map<String, dynamic>> getAuthToken();
  Future<Map<String, dynamic>> getOrderId(
      {required String token, required int amount, required String currency});
  Future<Map<String, dynamic>> getPaymentKey(
      {required String token,
      required int amount,
      required String currency,
      required int orderId});
  Future<PaymobTransactionModel> getTransactionStatus({
    required String token,
    required String orderId,
  });
}

class PaymobRemoteDataSourceImpl implements PaymobRemoteDataSource {
  final ApiServices apiServices;

  PaymobRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<Map<String, dynamic>> getAuthToken() async {
    return await apiServices
        .postRequest(endPoint: PaymobKeys.authRequestApi, data: {
      "api_key": PaymobKeys.payMobApiKey,
    });
  }

  @override
  Future<Map<String, dynamic>> getOrderId({
    required String token,
    required int amount,
    required String currency,
  }) async {
    return await apiServices
        .postRequest(endPoint: PaymobKeys.orderIdApi, data: {
      "auth_token": token,
      "amount_cents": (amount * 100).toString(),
      "currency": currency,
      "delivery_needed": "false",
      "items": [],
    });
  }

  @override
  Future<Map<String, dynamic>> getPaymentKey(
      {required String token,
      required int amount,
      required String currency,
      required int orderId}) async {
    return await apiServices
        .postRequest(endPoint: PaymobKeys.paymentKey, data: {
      "auth_token": token,
      "amount_cents": (amount * 100).toString(),
      "expiration": 3600,
      "currency": currency,
      "order_id": orderId,
      "integration_id": PaymobConstants.cardPaymentMethodIntegrationId,
      "billing_data": {
        "first_name": "Clifford",
        "last_name": "Nicolas",
        "email": "claudette09@exa.com",
        "phone_number": "+86(8)9135210487",
        ////////////////
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
      },
    });
  }

  @override
  Future<PaymobTransactionModel> getTransactionStatus({
    required String token,
    required String orderId,
  }) async {
    final result = await apiServices
        .postRequest(endPoint: PaymobKeys.transactionStatusApi, headers: {
      'Authorization': "Bearer $token",
    }, data: {
      "order_id": orderId
    });
    log(result.toString());
    PaymobTransactionModel transactionModel =
        PaymobTransactionModel.fromJson(result);

    return transactionModel;
  }
}

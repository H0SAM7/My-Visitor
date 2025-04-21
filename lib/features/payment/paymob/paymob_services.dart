import 'dart:developer';

import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/payment/paymob/data/helper/api_keys.dart';
import 'package:my_visitor/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymobServices {
  //steps 1
  Future<String> getAuthToken() async {
    final result = await ApiServices()
        .postRequest(endPoint: PaymobKeys.authRequestApi, data: {
      "api_key": PaymobKeys.payMobApiKey,
    });
    // log(result.toString());
    return result['token'];
  }

//step 2
  Future<int> getOrderId(
      {required String token,
      required int amount,
      required String currency}) async {
    try {
      final result =
          await ApiServices().postRequest(endPoint: PaymobKeys.orderId, data: {
        "auth_token": token,
        "amount_cents":
            (amount*100).toString(), //  >>(STRING)<< ---> amount with cent
        "currency": currency, //Not Req
        "delivery_needed": "false",
        "items": [],
      });
      //  log(result.toString());
      return result['id'];
    } catch (e) {
      log("Error in order id: $e");
      // Return a failure message instead of throwing an error
      return 0;
    }
  }

//step 3
  Future<String> getPaymentKey({
    required String token,
    required int amount,
    required String currency,
    required int orderId,
  }) async {
    final result =
        await ApiServices().postRequest(endPoint: PaymobKeys.paymentKey, data: {
      "auth_token": token,
      "amount_cents": (amount * 100).toString(), // السعر بالقروش
      "expiration":
          3600, // وقت انتهاء صلاحية رمز الدفع هذا بالثواني. (الحد الأقصى هو 3600 ثانية وهي ساعة)
      "currency": currency, // العملة جنية مصري
      "order_id": orderId, // من الخطوة 2
      "integration_id": PaymobKeys.cardPaymentMethodIntegrationId,
          "billing_data": {
        //Have To Be Values
        "first_name": "Clifford",
        "last_name": "Nicolas",
        "email": "claudette09@exa.com",
        "phone_number": "+86(8)9135210487",

        //Can Set "NA"
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
    log('payment token @@@@@@@@@@ ${result['token']}');
    return result['token'];
  }

  Future<void> payMobPay({
    required int amount,
  }) async {
    try {
  final authToken = await getAuthToken();
  final orderId = await getOrderId(
    token: authToken,
    amount: amount,
    currency: 'EGP',
  );
  final paymentKey = await getPaymentKey(
      token: authToken, amount: amount, currency: 'EGP', orderId: orderId);
  launchUrl(Uri.parse(
      "https://accept.paymob.com/api/acceptance/iframes/914974?payment_token=$paymentKey"));
}  catch (e) {
log('###########ERRRRRRR $e');}
  }
}

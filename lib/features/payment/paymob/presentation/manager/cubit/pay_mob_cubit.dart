import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/core/utils/functions/url_luncher.dart';
import 'package:my_visitor/features/payment/paymob/data/helper/paymob_constants.dart';
import 'package:my_visitor/features/payment/paymob/data/models/transaction_model.dart';
import 'package:my_visitor/features/payment/paymob/data/repos/paymob_repo_impl.dart';

part 'pay_mob_state.dart';

class PayMobCubit extends Cubit<PayMobState> {
  PayMobCubit() : super(PayMobInitial());
  Future<void> processPayment(int amount) async {
    try {
      emit(PaymobLoadingState());

      // Get the Auth Token
      final authTokenResult = await PaymobRepoImpl().getAuthToken();
      authTokenResult.fold(
        (failure) => emit(
            PaymobFailureState(errorMessage: failure.errMessage.toString())),
        (authToken) async {
          // Get the Order ID
          final orderIdResult = await PaymobRepoImpl().getOrderId(
            token: authToken,
            amount: amount,
            currency: 'EGP',
          );
          orderIdResult.fold(
            (failure) => emit(PaymobFailureState(
                errorMessage: failure.errMessage.toString())),
            (orderId) async {
              // Get the Payment Key
              final paymentKeyResult = await PaymobRepoImpl().getPaymentKey(
                token: authToken,
                amount: amount,
                currency: 'EGP',
                orderId: orderId,
              );
              paymentKeyResult.fold(
                  (failure) => emit(PaymobFailureState(
                      errorMessage: failure.errMessage.toString())),
                  (paymentKey) async {
                log('tokenn $authToken');
                log("https://accept.paymob.com/api/acceptance/iframes/914974?payment_token=$paymentKey");

                bool success = await launchUrlMethod(
                  Uri.parse(
                      "https://accept.paymob.com/api/acceptance/iframes/${PaymobConstants.idFrame1}?payment_token=$paymentKey"),
                );

                log( " ******************************* https://accept.paymob.com/api/acceptance/iframes/${PaymobConstants.idFrame1}?payment_token=$paymentKey");
                await Future.delayed(
                  Duration(seconds: 60),
                );

                if (success) {
                  log("*******************************$success");
                  emit(PaymobSuccessState(
                    token: authToken,
                    orderId: orderId.toString(),
                  ));
                }
              });
            },
          );
        },
      );
    } catch (e) {
      emit(PaymobFailureState(errorMessage: e.toString()));
    }
  }

  Future<PaymobTransactionModel> updatePaymentStatus({
    required String orderId,
    required String token,
  }) async {
    try {
      emit(PaymobTransactionloading());
      await Future.delayed(Duration(minutes: 2));

      final result = await PaymobRepoImpl().getTransactionStatus(
        token: token,
        orderId: orderId,
      );

      PaymobTransactionModel? transactionResult;

      result.fold(
        (failure) {
          emit(PaymobTransactionFailure(
            errMessage: failure.errMessage.toString(),
          ));
        },
        (transaction) {
          if (transaction.success) {
            log('transssssssss ${transaction.success.toString()}');
            log('PaymobTransactionModel Variables:');
            log('id: ${transaction.id}');
            log('success: ${transaction.success}');
            log('pending: ${transaction.pending}');
            log('isAuth: ${transaction.isAuth}');
            log('isCapture: ${transaction.isCapture}');
            log('isStandalonePayment: ${transaction.isStandalonePayment}');
            log('isVoided: ${transaction.isVoided}');
            log('isRefunded: ${transaction.isRefunded}');
            log('amountCents: ${transaction.amountCents}');
            log('createdAt: ${transaction.createdAt}');
            log('currency: ${transaction.currency}');

            emit(PaymobTransactionSuccess());
            transactionResult = transaction;
          } else {
            emit(PaymobTransactionFailure(errMessage: 'Payment failed.'));
          }
        },
      );

      if (transactionResult != null) {
        return transactionResult!;
      } else {
        throw Exception("Failed to fetch transaction.");
      }
    } catch (e) {
      log(e.toString());
      emit(PaymobTransactionFailure(errMessage: e.toString()));
      throw Exception("Exception during updatePaymentStatus: $e");
    }
  }
}

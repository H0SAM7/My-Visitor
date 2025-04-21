import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/hotels/data/sources/remote/hotel_remote_data_source.dart';
import 'package:my_visitor/features/payment/paymob/data/repos/paymob_repo_impl.dart';
import 'package:url_launcher/url_launcher.dart';

part 'pay_mob_state.dart';

class PayMobCubit extends Cubit<PayMobState> {
  PayMobCubit() : super(PayMobInitial());
  Future<void> processPayment(int amount) async {
    try {
      emit(PaymobLoadingState());

      // Get the Auth Token
      final authTokenResult = await PaymobRepoImpl().getAuthToken();
      authTokenResult.fold(
        (failure) => emit(PaymobFailureState(errorMessage:  failure.errMessage.toString())),
        (authToken) async {
          // Get the Order ID
          final orderIdResult = await PaymobRepoImpl().getOrderId(
            token: authToken,
            amount: amount,
            currency: 'EGP',
          );
          orderIdResult.fold(
            (failure) =>
                emit(PaymobFailureState(errorMessage:  failure.errMessage.toString())),
            (orderId) async {
              // Get the Payment Key
              final paymentKeyResult = await PaymobRepoImpl().getPaymentKey(
                token: authToken,
                amount: amount,
                currency: 'EGP',
                orderId: orderId,
              );
              paymentKeyResult.fold(
                (failure) =>
                    emit(PaymobFailureState(errorMessage:  failure.errMessage.toString())),
                (paymentKey) {
                  // Successfully retrieved the payment key, launch the URL
                  launchUrl(Uri.parse(
                      "https://accept.paymob.com/api/acceptance/iframes/914974?payment_token=$paymentKey"));
                  emit(PaymobSuccessState());
                },
              );
            },
          );
        },
      );
    } catch (e) {
      emit(PaymobFailureState(errorMessage:  e.toString()));
    }
  }
}

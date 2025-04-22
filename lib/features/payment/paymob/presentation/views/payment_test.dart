import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/features/payment/paymob/data/helper/apis.dart';
import 'package:my_visitor/features/payment/paymob/data/helper/paymob_constants.dart';
import 'package:my_visitor/features/payment/paymob/data/repos/paymob_repo_impl.dart';
import 'package:my_visitor/features/payment/paymob/paymob_services.dart';
import 'package:my_visitor/features/payment/paymob/presentation/manager/cubit/pay_mob_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PayMobCubit(),
      child: MaterialApp(
        title: 'Flutter Counter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  final String iframeId =
      PaymobConstants.idFrame1; // Use your Paymob iframe ID here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            BlocConsumer<PayMobCubit, PayMobState>(
              listener: (context, state) => {
                if(state is PaymobSuccessState){
                  
                 
                }
              },
              builder: (context, state) {
                if (state is PaymobLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is PaymobSuccessState) {

                  return Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          // Trigger the payment process on button press
                          await BlocProvider.of<PayMobCubit>(context)
                              .processPayment(100);
                        },
                        icon: const Icon(
                          Icons.payment,
                          size: 80,
                        ),
                      ),
                      const Text("Payment successful!"),
                    ],
                  );
                } else if (state is PaymobFailureState) {
                  return Column(
                    children: [
                      Text('Error: ${state.errorMessage}',
                          style: TextStyle(color: Colors.red)),
                      ElevatedButton(
                        onPressed: () {
                          // Retry the payment process on failure
                          BlocProvider.of<PayMobCubit>(context)
                              .processPayment(100);
                        },
                        child: const Text('Retry Payment'),
                      ),
                    ],
                  );
                }
                return ElevatedButton(
                  onPressed: () async {
                    // Trigger payment process on button click
                    await BlocProvider.of<PayMobCubit>(context)
                        .processPayment(100);
                  },
                  child: const Text('Start Payment'),
                );
              },
            ),
            SizedBox(height: 100,),
            IconButton(
                onPressed: () async {
                  // ///////////////////////////////////////////////
                  final authToken = await PaymobServices().getAuthToken();
                  log('auth tokkkkkkkkkkkkkkkkkkkkennnnn $authToken');
                  final orderId = await PaymobServices().getOrderId(
                    token: authToken,
                    amount: 100,
                    currency: 'EGP',
                  );
                  log('order tokkkkkkkkkkkkkkkkkkkkennnnn $orderId');

                  final paymentKey = await PaymobServices().getPaymentKey(
                    token: authToken,
                    amount: 100,
                    currency: 'EGP',
                    orderId: orderId,
                  );
                  log('paaaayment key tokkkkkkkkkkkkkkkkkkkkennnnn $authToken');

                  log("https://accept.paymob.com/api/acceptance/iframes/914974?payment_token=$paymentKey");
                  launchUrl(
                    Uri.parse(
                        "https://accept.paymob.com/api/acceptance/iframes/914973?payment_token=$paymentKey"),
                  );

                  log('&&&&&&&&&&&&&&&&&&&&&&&&&&&&#############################');
                  //  var trans = await PaymobRepoImpl().getTransactionStatus(
                  //     orderId: orderId.toString(), token: authToken);
                  // log(trans.toString());
                  await BlocProvider.of<PayMobCubit>(context)
                      .updatePaymentStatus(
                    orderId: orderId.toString(),
                    token: authToken,
                  );
                  // //////////////////////////////////////
                },
                icon: Icon(Icons.access_time_sharp))
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/localization/generated/l10n.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_progress_hud.dart';
import 'package:my_visitor/core/widgets/custom_text_field.dart';
import 'package:my_visitor/core/widgets/show_custom_alert.dart';
import 'package:my_visitor/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:my_visitor/features/auth/views/forget_view.dart';
import 'package:my_visitor/features/auth/views/register_view.dart';
import 'package:my_visitor/features/auth/views/widgets/custom_send_button.dart';
import 'package:my_visitor/features/auth/views/widgets/google_button.dart';
import 'package:my_visitor/features/auth/views/widgets/have_acc_widget.dart';
import 'package:my_visitor/features/auth/views/widgets/or_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email, password;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            AnimationRoutes.routeBottom(
              const BottomNavigator(),
            ),
          );

          //  Navigator.pushReplacementNamed(context, screenTSt.id);
        } else if (state is AuthFailure) {
          showCustomAlert(
            context: context,
            type: AlertType.error,
            title: s.errorTitle,
            description: state.errMessage,
            closeFunction: () {
                 Navigator.of(context, rootNavigator: true).pop();
            },
            onPressed: () {
               Navigator.of(context, rootNavigator: true).pop();
            },
            actionTitle: s.Ok,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          inAsyncCall: state is AuthLoading,
          child: AbsorbPointer(
            absorbing: state is AuthLoading,
            child: Scaffold(
              backgroundColor: Colors.black,
              body:
                  // size: MediaQuery.of(context).size,

                  Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120.h,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          s.welcomeBack,
                          style: AppStyles.style22White(context)
                              .copyWith(fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFrom(
                        hint: s.emailHint,
                        label: s.emailLabel,
                        onChanged: (value) {
                          email = value;
                          log(s.emailLabel);
                        },
                      ),
                      CustomTextFrom(
                        hint: s.passwordHint,
                        label: s.passwordLabel,
                        isPasswordField: true,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ForgetView.id);
                          },
                          child: Text(
                            s.forgetPassword,
                            style: TextStyle(color: orangeColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: CustomSendButton(
                          label: s.loginButton,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await BlocProvider.of<AuthCubit>(context)
                                  .login(email: email!, password: password!);
                              await FirebaseMessaging.instance
                                  .subscribeToTopic(notifiGroup);
                            }

                            //  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                            //                   if (user == null) {
                            //                     Navigator.pushNamed(context, RegisterView.id);
                            //                     log('User is currently signed out!');
                            //                   } else {
                            //                     if (user.emailVerified) {
                            //                       Navigator.pushReplacementNamed(context, BottomNavigator.id);
                            //                       log('User is signed in!');
                            //                     } else if (!user.emailVerified) {
                            //                       // Navigator.pushReplacementNamed(
                            //                       //     context, VerificationView.id);
                            //                     } else {
                            //                       Navigator.pushReplacementNamed(context, RegisterView.id);
                            //                     }
                            //                   }
                            //                 });
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      const Center(child: OrWidget()),

                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: GoogleButton(
                          onTap: () async {
                            await BlocProvider.of<AuthCubit>(context)
                                .signInWithGoogle();
                            await FirebaseMessaging.instance
                                .subscribeToTopic(notifiGroup);
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HaveAccWidget(
                            title: s.dontHaveAccount,
                            action: s.signUpAction,
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterView.id);
                            },
                          ),
                        ],
                      ),
                      //   const SocialAuth(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

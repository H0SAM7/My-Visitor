import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/models/user_model.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/core/widgets/custom_progress_hud.dart';
import 'package:my_visitor/core/widgets/custom_text_field.dart';
import 'package:my_visitor/core/widgets/show_custom_alert.dart';
import 'package:my_visitor/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/widgets/custom_send_button.dart';
import 'package:my_visitor/features/auth/views/widgets/google_button.dart';
import 'package:my_visitor/features/auth/views/widgets/have_acc_widget.dart';
import 'package:my_visitor/features/auth/views/widgets/or_widget.dart';
import 'package:my_visitor/core/localization/generated/l10n.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password, phone, fatherPhone, name;
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, LoginView.id);
        } else if (state is AuthSendVerification) {
          showCustomAlert(
            context: context,
            type: AlertType.info,
            title: s.checkEmailVerify,
            description: s.checkEmailVerifyDesc,
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginView.id);
            },
            actionTitle: s.Ok,
          );
        } else if (state is AuthVerificationFailure) {
          showCustomAlert(
            context: context,
            type: AlertType.warning,
            title: s.timeoutTitle,
            description: state.errMessage,
            closeFunction: () {
              Navigator.pushReplacementNamed(context, RegisterView.id);
            },
            onPressed: () {
              Navigator.pushReplacementNamed(context, RegisterView.id);
            },
            actionTitle: s.okButton,
          );
        } else if (state is AuthFailure) {
          if (!_isDialogShowing) {
            _isDialogShowing = true;

            showCustomAlert(
              context: context,
              type: AlertType.error,
              title: s.errorTitle,
              description: state.errMessage,
              onPressed: () {
                _isDialogShowing = false;

                Navigator.of(context, rootNavigator: true).pop();
              },
              actionTitle: s.okButton,
            );
          }
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          inAsyncCall: state is AuthLoading,
          child: AbsorbPointer(
            absorbing: state is AuthLoading,
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomBack(),
                      ),

                      SizedBox(
                        height: 90.h,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          s.helloRegister,
                          style: AppStyles.style22White(context)
                              .copyWith(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFrom(
                        hint: s.nameHint,
                        label: s.nameLabel,
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      CustomTextFrom(
                        hint: s.emailHint,
                        label: s.emailLabel,
                        onChanged: (value) {
                          email = value;
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

                      HaveAccWidget(
                        title: s.youHaveAccount,
                        action: s.loginAction,
                        onPressed: () {
                          Navigator.pushNamed(context, LoginView.id);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CustomSendButton(
                          label: s.signUpAction,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final user = UserModel(
                                email: email!,
                                name: name,
                              );

                              await BlocProvider.of<AuthCubit>(context)
                                  .register(
                                      userModel: user, password: password!);

                              await FirebaseMessaging.instance
                                  .subscribeToTopic(notifiGroup);
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(child: OrWidget()),
                      const SizedBox(
                        height: 10,
                      ),
                      // const SocialAuth(),
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

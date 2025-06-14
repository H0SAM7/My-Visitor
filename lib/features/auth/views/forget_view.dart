import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/core/widgets/custom_text_field.dart';
import 'package:my_visitor/core/widgets/show_custom_alert.dart';
import 'package:my_visitor/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/widgets/custom_send_button.dart';import 'package:my_visitor/core/localization/generated/l10n.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});
  static String id = 'ForgetView';

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
                                    final s= S.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showCustomAlert(
            context: context,
            type: AlertType.info,
            title: s.checkEmailVerify,
            description:
               s.checkEmailResetDesc,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                AnimationRoutes.fadeRoute(
                  const LoginView(),
                ),
              );
            },
            actionTitle: s.Ok,
          );
        } else if (state is AuthFailure) {
          showCustomAlert(
            context: context,
            type: AlertType.error,
            title: s.errorTitle,
            description: state.errMessage,
            onPressed: () {
             Navigator.pushReplacement(
                context,
                AnimationRoutes.fadeRoute(
                  const ForgetView(),
                ),
              );
            },
            actionTitle:s.Ok,
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomBack(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  s.forgetPassword,
                  style: AppStyles.style32(context, Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                  s.dontWorry,
                    style: AppStyles.style18(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFrom(
                  label: s.email,
                  hint: s.emailHint,
                  controller: emailController,
                  onChanged: (email) {
                    emailController.text = email;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomSendButton(
                    label:s.sendButton,
                    onTap: () async {
                      if ((formKey.currentState!.validate())) {
                        await BlocProvider.of<AuthCubit>(context)
                            .resetPassword(emailController.text);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginView.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       s.rememberPassword,
                        //   textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        s.loginButton,
                        style: TextStyle(color: orangeColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

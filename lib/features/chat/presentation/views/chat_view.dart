import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/features/chat/presentation/manager/cubit_cubit/chat_cubit.dart';
import 'package:my_visitor/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/generated/l10n.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.contactEmail,
  });
  static const String id = 'ChatView';
  final String contactEmail;

  @override
  Widget build(BuildContext context) {
                            final s= S.of(context);

    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: CustomBack(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               s.chat_view_title,
                style: AppStyles.style22White(context),
                
              ),
              Text(
               s.chat_view_reply_time,
                style: AppStyles.style16Gray(context),
              ),
            ],
            
          ),
        ),
        body: ChatViewBody(
          contactEmail: contactEmail,
        ),
      ),
    );
  }
}

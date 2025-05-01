import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/features/chat/presentation/manager/cubit_cubit/chat_cubit.dart';
import 'package:my_visitor/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.contactEmail,
  });
  static const String id = 'ChatView';
  final String contactEmail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          leading: CustomBack(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Support Team",
                style: AppStyles.style22White(context),
                
              ),
              Text(
                'Typically replies within 5 minutes',
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

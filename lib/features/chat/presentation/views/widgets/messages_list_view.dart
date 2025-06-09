import 'package:my_visitor/features/chat/data/models/message_model.dart';
import 'package:my_visitor/features/chat/presentation/views/widgets/message_view.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView(
      {super.key, required this.controller, required this.messagesList});
  final ScrollController controller;
  final List<MessageModel> messagesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messagesList.length,
        controller: controller,
        itemBuilder: (context, index) {
          return messagesList[index].sender ==
                  FirebaseAuth.instance.currentUser!.email!
              ? Expanded(
                child: MyMessage(
                    messageModel: messagesList[index],
                  ),
              )
              : Expanded(
                child: FriendMessage(
                    messageModel: messagesList[index],
                  ),
              );
        });
  }
}

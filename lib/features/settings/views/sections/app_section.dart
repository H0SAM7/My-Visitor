import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/Notifications/views/notifi_view.dart';
import 'package:my_visitor/features/chat/presentation/views/chat_view.dart';
import 'package:my_visitor/features/settings/views/about_view.dart';
import 'package:my_visitor/features/settings/views/faqs_view.dart';
import 'package:my_visitor/features/settings/views/privacy_view.dart';
import 'package:my_visitor/features/settings/views/widgets/item_setting.dart';
import 'package:flutter/material.dart';

class AppSections extends StatelessWidget {
  const AppSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        ItemSetting(
          onTap: () {
                 Navigator.pushNamed(context, NotifiView.id);
          },
          leading: Image.asset(
            Assets.iconsBell,
            color: orangeColor,
          ),
          title: 'Notifications',
        ),
        ItemSetting(
          onTap: () {
          },
          leading: Icon(
            Icons.language_outlined,
            color: orangeColor,
          ),
          title: 'Language',
        ),
      ],
    );
  }
}

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemSetting(
          leading: Icon(
            Icons.help_center_outlined,
            color: orangeColor,
          ),
          title: 'FAQs',
          onTap: (){
            Navigator.pushNamed(context, FaqsView.id);
          },
        ),
        ItemSetting(
          leading: Icon(
            Icons.info_outline,
            color: orangeColor,
          ),
          title: 'About App',
          onTap: (){
            Navigator.pushNamed(context, AboutView.id);
          },
        ),
        ItemSetting(
          leading: Icon(
            Icons.privacy_tip_outlined,
            color: orangeColor,
          ),
          title: 'privacy & policy',
          onTap: (){
            Navigator.pushNamed(context, PrivacyPolicyView.id);
          },
        ),
        ItemSetting(
          leading: Icon(
            Icons.chat_bubble_outline,
            color: orangeColor,
          ),
          title: 'Support Team',
          onTap: (){
            Navigator.pushNamed(context, ChatView.id);
          },
        ),
      ],
    );
  }
}




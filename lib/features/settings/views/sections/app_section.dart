import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/Notifications/views/notifi_view.dart';
import 'package:my_visitor/features/chat/presentation/views/chat_view.dart';
import 'package:my_visitor/features/settings/views/about_view.dart';
import 'package:my_visitor/features/settings/views/faqs_view.dart';
import 'package:my_visitor/features/settings/views/privacy_view.dart';
import 'package:my_visitor/features/settings/views/widgets/item_setting.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/generated/l10n.dart';

class AppSections extends StatelessWidget {
  const AppSections({super.key});

  @override
  Widget build(BuildContext context) {
                        final s= S.of(context);

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
          title: s.notifications,
        ),
        ItemSetting(
          onTap: () {
          },
          leading: Icon(
            Icons.language_outlined,
            color: orangeColor,
          ),
          title: s.language,
        ),
      ],
    );
  }
}

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
                        final s= S.of(context);

    return Column(
      children: [
        ItemSetting(
          leading: Icon(
            Icons.help_center_outlined,
            color: orangeColor,
          ),
          title: s.faqs,
          onTap: (){
            Navigator.pushNamed(context, FaqsView.id);
          },
        ),
        ItemSetting(
          leading: Icon(
            Icons.info_outline,
            color: orangeColor,
          ),
          title:s.aboutApp,
          onTap: (){
            Navigator.pushNamed(context, AboutView.id);
          },
        ),
        ItemSetting(
          leading: Icon(
            Icons.privacy_tip_outlined,
            color: orangeColor,
          ),
          title:s.privacyPolicy,
          onTap: (){
            Navigator.pushNamed(context, PrivacyPolicyView.id);
          },
        ),
        ItemSetting(
          leading: Icon(
            Icons.chat_bubble_outline,
            color: orangeColor,
          ),
          title: s.supportTeam,
          onTap: (){
            Navigator.pushNamed(context, ChatView.id);
          },
        ),
      ],
    );
  }
}




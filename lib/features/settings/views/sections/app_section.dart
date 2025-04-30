import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
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
            //         Navigator.pushNamed(context, NotifiView.id);
          },
          leading: Icon(
            Icons.history_outlined,
            color: orangeColor,
          ),
          title: 'Booking History',
        ),
        ItemSetting(
          onTap: () {
            //         Navigator.pushNamed(context, NotifiView.id);
          },
          leading: Image.asset(
            Assets.iconsBell,
            color: orangeColor,
          ),
          title: 'Notifications',
        ),
        ItemSetting(
          onTap: () {
            //         Navigator.pushNamed(context, NotifiView.id);
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
        ),
        ItemSetting(
          leading: Icon(
            Icons.info_outline,
            color: orangeColor,
          ),
          title: 'About App',
        ),
        ItemSetting(
          leading: Icon(
            Icons.privacy_tip_outlined,
            color: orangeColor,
          ),
          title: 'privacy & policy',
        ),
      ],
    );
  }
}




import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/settings/views/booking_info.dart';
import 'package:my_visitor/features/settings/views/sections/personal_info_view.dart';
import 'package:my_visitor/features/settings/views/widgets/item_setting.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/generated/l10n.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
                        final s= S.of(context);

    return Column(
      children: [
        ItemSetting(
          leading: Image.asset(Assets.iconsUser,color: orangeColor,),
          title: s.personalInfo,
          onTap: () {
            Navigator.pushNamed(context, PersonalInfoView.id);
          },
        ),
         ItemSetting(
          onTap: () {
                Navigator.pushNamed(context, BookingInfoView.id);
          },
          leading: Icon(
            Icons.history_outlined,
            color: orangeColor,
          ),
          title: s.bookingInfo,

        ),
      
      ],
    );
  }
}

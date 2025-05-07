import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/localization/lang_cubit.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/is_ar.dart';
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
    final s = S.of(context);

    return Column(
      children: [
        ItemSetting(
          onTap: () {
            Navigator.pushNamed(context, NotifiView.id);
          },
          leading: Image.asset(
            Assets.iconsRinging,
            color: orangeColor,
                  height: 26.h,

          ),
          title: s.notifications,
        ),
        ItemSetting(
          title: s.language,
          leading: Image.asset(Assets.iconsLanguage,color: orangeColor,          height: 26.h,
),
          onTap: () {
            log(isArabic(context).toString());
            context.read<LanguageCubit>().setLocale(
                  isArabic(context)
                      ? const Locale('en', '')
                      : const Locale('ar', ''),
                );
          },
          trailing: Text(
            isArabic(context) ? 'English' : 'العربية',
            style: TextStyle(
              color: orangeColor,
            ),
          ),
        ),
      ],
    );
  }
}

class LangSwitch extends StatelessWidget {
  const LangSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isArabic(context) ? 'English' : 'العربية',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.arrow_forward_ios,
          size: 19,
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }
}

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      children: [
        ItemSetting(
          leading: Image.asset(Assets.iconsQuestion,color: orangeColor,          height: 26.h,
),
          title: s.faqs,
          onTap: () {
            Navigator.pushNamed(context, FaqsView.id);
          },
        ),
        ItemSetting(
          leading: Image.asset(Assets.iconsInformation,color: orangeColor,          height: 26.h,
),
          title: s.aboutApp,
          onTap: () {
            Navigator.pushNamed(context, AboutView.id);
          },
        ),
        ItemSetting(
          leading: Image.asset(Assets.iconsPersonalData,color: orangeColor,          height: 26.h,
),
          title: s.privacyPolicy,
          onTap: () {
            Navigator.pushNamed(context, PrivacyPolicyView.id);
          },
        ),
        ItemSetting(
          leading: Image.asset(Assets.iconsCustomerSupport,color: orangeColor,          height: 26.h,
),
          title: s.supportTeam,
          onTap: () {
            Navigator.pushNamed(context, ChatView.id);
          },
        ),
      ],
    );
  }
}

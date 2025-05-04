import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/settings/views/sections/app_section.dart';
import 'package:my_visitor/features/settings/views/sections/info_section.dart';
import 'package:my_visitor/features/settings/views/widgets/item_setting.dart';
import 'package:my_visitor/features/settings/views/widgets/setting_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/features/splash/onboarding_view.dart';
import 'package:my_visitor/generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static String id = 'SettingsView';
  @override
  Widget build(BuildContext context) {

                    final s= S.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          s.settings,
          style: AppStyles.style22White(context),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const UserDetailsSection(),
            SizedBox(
              height: 15.h,
            ),
            const SettingContainer(
              child: InfoSection(),
            ),
            const SettingContainer(
              child: AppSections(),
            ),
            const SettingContainer(
              child: GeneralSection(),
            ),

            SettingContainer(
              child: ItemSetting(
                leading: Image.asset(
                  Assets.iconsLogout,
                  color: orangeColor,
                ),
                title: s.logout,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, OnboardingView.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

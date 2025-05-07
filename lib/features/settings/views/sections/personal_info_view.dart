import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/core/widgets/custom_app_bar.dart';
import 'package:my_visitor/features/settings/views/sections/edit_profile_view.dart';
import 'package:my_visitor/features/settings/views/widgets/profile_utils.dart';
import 'package:my_visitor/features/settings/views/widgets/setting_container.dart';
import 'package:my_visitor/generated/l10n.dart';

class AppConstants {
  static const String defaultUsername = 'User Name';
  static const String defaultEmail = 'User@gmail.com';
  static const String defaultPhone = 'Not Provided';
  static const String defaultProfileImage = Assets.imagesDefualtProfile;
}

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});
  static String id = 'PersonalInfoView';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: s.personalInfo,
            widget: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProfileView.id).then((result) {
                  if (result == true) {
                    _PersonalInfoSectionState? sectionState = context
                        .findAncestorStateOfType<_PersonalInfoSectionState>();
                    sectionState?.refreshProfile();
                  }
                });
              },
              child: Text(
                s.edit,
                style: TextStyle(color: orangeColor,
                fontSize: 18),
                
              ),
            ),
          ),
          const SettingContainer(child: PersonalInfoSection()),
        ],
      ),
    );
  }
}

class PersonalInfoSection extends StatefulWidget {
  const PersonalInfoSection({super.key});

  @override
  State<PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<PersonalInfoSection> {
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    super.initState();
    _checkUserAndLoadInfo();
    refreshProfile();
  }

  Future<void> _checkUserAndLoadInfo() async {
    if (FirebaseAuth.instance.currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, LoginView.id);
      });
      return;
    }
    await _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    try {
      userInfo = await ProfileUtils.getUserProfile();
      log('Loaded user info: $userInfo');
      setState(() {});
    } catch (e) {
      log('Error loading user info: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load user info')),
      );
      userInfo = {
        'username': AppConstants.defaultUsername,
        'email': AppConstants.defaultEmail,
        'phone': AppConstants.defaultPhone,
        'profileImageUrl': AppConstants.defaultProfileImage,
      };
      setState(() {});
    }
  }

  // New method to refresh profile data
  Future<void> refreshProfile() async {
    log('Refreshing profile data');
    await _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return userInfo == null
        ? Center(child: LoadingWidgets.loadingthreeRotatingDots(size: 60))
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: CircleAvatar(
                                  backgroundColor: orangeColor,
                                  radius: 55,
                                  backgroundImage: userInfo!['profileImageUrl'] != null &&
                     userInfo!['profileImageUrl'].isNotEmpty
                 ? NetworkImage(userInfo!['profileImageUrl'])
                 : const AssetImage(AppConstants.defaultProfileImage)
                     as ImageProvider,
                                  onBackgroundImageError: (exception, stackTrace) {
                                    log('Error loading profile image: $exception');
                                  },
                                ),
              ),
             Divider(
              color: Colors.white,
              endIndent: 40.6,
              indent:40.6,
             ),
              const SizedBox(height: 20),
              CustomListTile(
                title: s.full_name,
                subtitle: userInfo!['username']!,
                leading: Image.asset(
                  Assets.iconsUser,
                  color: orangeColor,
                            height: 26.h,

                ),
              ),
              CustomListTile(
                title: s.email,
                subtitle: userInfo!['email']!,
                leading: Icon(
                  FontAwesomeIcons.envelope,
                  size: 26,
                  color: orangeColor,
                ),
              ),
              CustomListTile(
                title: s.phone_number,
                subtitle: userInfo!['phone']!,
                leading: Image.asset(
                  Assets.iconsCall,
                  color: orangeColor,
                            height: 26.h,

                ),
              ),
            ],
          );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: AppStyles.style18(context),
      ),
      subtitle: Text(
        subtitle,
        style: AppStyles.style16Gray(context),
      ),
      trailing: trailing,
    );
  }
}

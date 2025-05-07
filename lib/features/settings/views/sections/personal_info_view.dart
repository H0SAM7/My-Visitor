import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/models/user_model.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/core/widgets/custom_app_bar.dart';
import 'package:my_visitor/features/settings/views/sections/edit_profile_view.dart';
import 'package:my_visitor/features/settings/views/widgets/profile_utils.dart';
import 'package:my_visitor/features/settings/views/widgets/setting_container.dart';
import 'package:my_visitor/generated/l10n.dart';

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
        sectionState?.loadUserData();
      }
    });
              },
              child: Text(
                s.edit,
                style: TextStyle(color: orangeColor, fontSize: 18),
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
  final ProfileUtils _userService = ProfileUtils();
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    _checkUserAndLoadInfo();
    refreshProfile();
    setState(() {});
  }

  Future<void> _checkUserAndLoadInfo() async {
    if (FirebaseAuth.instance.currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, LoginView.id);
      });
      return;
    }
    await loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final userModel = await _userService.loadUserData();
      setState(() {
        this.userModel = userModel;
      });
    } catch (e) {
      log('Error loading user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load user data')),
      );
    }
  }

  Future<void> refreshProfile() async {
    try {
      final userModel = await _userService.refreshProfile();
      setState(() {
        this.userModel = userModel;
      });
    } catch (e) {
      log('Error refreshing profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to refresh profile')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return userModel == null
        ? Center(child: LoadingWidgets.loadingthreeRotatingDots(size: 60))
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: CircleAvatar(
                  backgroundColor: orangeColor,
                  radius: 55,
                  backgroundImage:
                      userModel!.image == null || userModel!.image!.isEmpty
                          ? const AssetImage(AppConstants.defaultProfileImage)
                          : CachedNetworkImageProvider(
                              userModel!.image!,
                            ) as ImageProvider<Object>,
                ),
              ),
              Divider(
                color: Colors.white,
                endIndent: 40.6,
                indent: 40.6,
              ),
              const SizedBox(height: 20),
              CustomListTile(
                title: s.full_name,
                subtitle: userModel!.name ?? AppConstants.defaultUsername,
                leading: Image.asset(
                  Assets.iconsUser,
                  color: orangeColor,
                  height: 26.h,
                ),
              ),
              CustomListTile(
                title: s.email,
                subtitle: userModel!.email,
                leading: Icon(
                  FontAwesomeIcons.envelope,
                  size: 26,
                  color: orangeColor,
                ),
              ),
              CustomListTile(
                title: s.phone_number,
                subtitle: userModel!.phoneNumber ?? AppConstants.defaultPhone,
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

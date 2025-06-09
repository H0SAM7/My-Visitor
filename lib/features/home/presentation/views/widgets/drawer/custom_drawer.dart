import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/models/user_model.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/chat/presentation/views/chat_view.dart';
import 'package:my_visitor/features/chatbot/screens/chat_screen.dart';
import 'package:my_visitor/features/settings/views/sections/personal_info_view.dart';
import 'package:my_visitor/features/settings/views/widgets/profile_utils.dart';
import 'package:my_visitor/features/translation/translation_view.dart';import 'package:my_visitor/core/localization/generated/l10n.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final ProfileUtils _userService = ProfileUtils();
  UserModel? userModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkUserAndLoadInfo();
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
    setState(() {
      _isLoading = true;
    });
    try {
      final userModel = await _userService.loadUserData();
      setState(() {
        this.userModel = userModel;
        log('Loaded user data: name=${userModel?.name}, email=${userModel?.email}, image=${userModel?.image}');
      });
    } catch (e) {
      log('Error loading user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Refresh data please try again')),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> refreshProfile() async {
    log('Starting profile refresh in CustomDrawer');
    try {
      final userModel = await _userService.refreshProfile();
      setState(() {
        this.userModel = userModel;
        log('Refreshed user data: name=${userModel?.name}, email=${userModel?.email}, image=${userModel?.image}');
      });
    } catch (e) {
      log('Error refreshing profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Refresh data please try again')),
      );
    }
  }

  bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasAbsolutePath &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Drawer(
      backgroundColor: Colors.black,
      child: _isLoading || userModel == null
          ? Center(child: LoadingWidgets.loadingthreeRotatingDots(size: 60))
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  arrowColor: Colors.black,
                  accountName:
                      Text(userModel!.name ?? AppConstants.defaultUsername),
                  accountEmail:
                      Text(userModel!.email ?? AppConstants.defaultEmail),
                  currentAccountPicture: CircleAvatar(
                    radius: 40.r,
                    backgroundColor: orangeColor,
                    child: ClipOval(
                      child: userModel!.image == null ||
                              userModel!.image!.isEmpty ||
                              !isValidUrl(userModel!.image)
                          ? Image.asset(
                              AppConstants.defaultProfileImage,
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            )
                          : CachedNetworkImage(
                              imageUrl: userModel!.image!,
                              placeholder: (context, url) => Center(
                                child: LoadingWidgets.loadingthreeRotatingDots(
                                    size: 30),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                AppConstants.defaultProfileImage,
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                    ),
                  ),
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                DrawerListTile(
                  title: s.accountInformation,
                  leading: Image.asset(
                    Assets.iconsUser,
                    color: orangeColor,
            height: 22.h,
            width: 22.w,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, PersonalInfoView.id)
                        .then((result) {
                      log('Returned from PersonalInfoView with result: $result');
                      if (result == true) {
                        refreshProfile();
                      }
                    });
                  },
                ),
                DrawerListTile(
                  title: s.translation,
                  leading: Icon(
                    Icons.translate_outlined,
                    color: orangeColor,
                    size: 22.w,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, TranslationView.id);
                  },
                ),
                DrawerListTile(
                  title: s.aiAssistant,
                  leading: Image.asset(
                    Assets.iconsChatbot,
                    color: orangeColor,
             height: 22.h,
            width: 22.w,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ChatbotScreen.id);
                  },
                ),
                DrawerListTile(
                  title: s.support,
                  leading: Image.asset(
                    Assets.iconsCustomerSupport,
                    color: orangeColor,
            height: 22.h,
            width: 22.w,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ChatView.id);
                  },
                ),
                const Divider(),
                DrawerListTile(
                  title: s.logout,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, LoginView.id);
                  },
                  leading: Image.asset(
                    Assets.iconsLogout,
          height: 22.h,
            width: 22.w,
                    color: orangeColor,
                  ),
                ),
              ],
            ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppStyles.style18(context).copyWith(
                color: Colors.white,
              ),
            )
          : null,
      trailing: trailing,
    );
  }
}

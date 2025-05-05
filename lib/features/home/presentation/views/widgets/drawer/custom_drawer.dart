import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/shared_pref.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/chat/presentation/views/chat_view.dart';
import 'package:my_visitor/features/chatbot/screens/chat_screen.dart';
import 'package:my_visitor/features/settings/views/sections/personal_info_view.dart';
import 'package:my_visitor/features/settings/views/widgets/profile_utils.dart';
import 'package:my_visitor/features/translation/translation_view.dart';
import 'package:my_visitor/generated/l10n.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Map<String, String>? userInfo;
  String? _profileImageUrl; // Changed to store URL instead of File

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, LoginView.id);
      });
      return;
    }

    try {
      // Fetch user profile from ProfileUtils, same as PersonalInfoView
      Map<String, dynamic>? profileData = await ProfileUtils.getUserProfile();
      if (profileData != null) {
        userInfo = {
          'username': profileData['username']?.toString() ??
              user.displayName ??
              AppConstants.defaultUsername,
          'email': profileData['email']?.toString() ??
              user.email ??
              AppConstants.defaultEmail,
          'phone':
              profileData['phone']?.toString() ?? AppConstants.defaultPhone,
        };
        _profileImageUrl = profileData['profileImageUrl']?.toString();
      } else {
        // Fallback to SharedPreferences or default values
        String? jsonString = await SharedPreference().getString(user.email!);
        if (jsonString != null) {
          Map<String, dynamic> storedUserInfo = jsonDecode(jsonString);
          userInfo = storedUserInfo
              .map((key, value) => MapEntry(key, value.toString()));
          _profileImageUrl = userInfo!['profileImageUrl'];
        } else {
          userInfo = {
            'username': user.displayName ?? AppConstants.defaultUsername,
            'email': user.email ?? AppConstants.defaultEmail,
            'phone': AppConstants.defaultPhone,
          };
          _profileImageUrl = AppConstants.defaultProfileImage;
        }
      }
      setState(() {});
    } catch (e) {
      userInfo = {
        'username': user.displayName ?? AppConstants.defaultUsername,
        'email': user.email ?? AppConstants.defaultEmail,
        'phone': AppConstants.defaultPhone,
      };
      _profileImageUrl = AppConstants.defaultProfileImage;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
                        final s= S.of(context);

    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            arrowColor: Colors.black,
            accountName:
                Text(userInfo?['username'] ?? AppConstants.defaultUsername),
            accountEmail: Text(userInfo?['email'] ?? AppConstants.defaultEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  _profileImageUrl != null && _profileImageUrl!.isNotEmpty
                      ? NetworkImage(_profileImageUrl!)
                      : const AssetImage(AppConstants.defaultProfileImage)
                          as ImageProvider,
            ),
            decoration: const BoxDecoration(color: Colors.black),
          ),
          DrawerListTile(
            title: s.accountInformation,
            leading: Image.asset(
              Assets.iconsUser,
              color: orangeColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, PersonalInfoView.id);
            },
          ),
          DrawerListTile(
            title: s.translation,
            leading: Icon(
              Icons.translate_outlined,
              color: orangeColor,
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
              height: 22,
            ),
            onTap: () {
              Navigator.pushNamed(context, ChatbotScreen.id);
            },
          ),
             DrawerListTile(
            title: s.support,
            leading: Icon(
              Icons.chat_bubble_outline,
              color: orangeColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, ChatView.id);
            },
          ),
      
         Divider(),
          DrawerListTile(
            title: s.logout,
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, LoginView.id);
            },
            leading: Image.asset(
              Assets.iconsLogout,
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

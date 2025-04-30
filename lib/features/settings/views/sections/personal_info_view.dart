import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/shared_pref.dart';
import 'package:my_visitor/features/chat/presentation/views/widgets/custom_app_bar.dart';
import 'package:my_visitor/features/settings/views/sections/edit_profile_view.dart';
import 'package:my_visitor/features/settings/views/widgets/setting_container.dart';
import 'package:my_visitor/features/settings/views/widgets/user_details_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});
  static String id = 'PersonalInfoView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Personal Info',
            widget: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProfileView.id);
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  color: orangeColor,
                ),
              ),
            ),
          ),
          const UserDetailsSection(),
          const SettingContainer(
            child: PersonalInfoSection(),
          )
        ],
      ),
    );
  }
}

class PersonalInfoSection extends StatefulWidget {
  const PersonalInfoSection({
    super.key,
  });

  @override
  State<PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<PersonalInfoSection> {
  Map<String, String>? userInfo;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, String> defaultValues = {
      'username': 'User Name', // Default full name
      'email': 'User@gmail.com', // Default email
    };

    if (user != null) {
      String? jsonString = await SharedPreference().getString(user.email!);

      if (jsonString != null) {
        Map<String, dynamic> storedUserInfo = jsonDecode(jsonString);

        userInfo =
            storedUserInfo.map((key, value) => MapEntry(key, value as String));
      } else {
        userInfo = defaultValues;
      }
    } else {
      userInfo = defaultValues;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: 'Full Name',
          subtitle: userInfo!['username']!,
          leading: Image.asset(
            Assets.iconsUser,
          ),
        ),
        CustomListTile(
          title: 'Email',
          subtitle: userInfo!['email']!,
          leading: Icon(FontAwesomeIcons.mailchimp),
        ),
        CustomListTile(
          title: 'Phone Number',
          subtitle: '01098894833',
          leading: Image.asset(
            Assets.iconsCall,
          ),
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      this.leading,
      this.trailing,
      required this.subtitle});
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: AppStyles.style18(context).copyWith(color: Colors.black)
      ),
      trailing: trailing,
    );
  }
}

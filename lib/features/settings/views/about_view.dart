import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:intl/intl.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static String id = 'AboutView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(Assets.imagesHomeLogo),
        centerTitle: true,
        leading:  CustomBack(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 700),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                _buildSectionTitle('about_name', context),
                _buildSectionContent('about_app_name'),
                const SizedBox(height: 16),
                _buildSectionTitle('about_version', context),
                _buildSectionContent('about_version_number'),
                const SizedBox(height: 16),
                _buildSectionTitle('about_description', context),
                // _buildSectionContent('about_description'),
                const SizedBox(height: 16),
                _buildSectionTitle('about_key_features', context),
                _buildFeatureList([
                  'about_feature_1',
                  'about_feature_2',
                  'about_feature_3',
                  'about_feature_4',
                  'about_feature_5',
                  'about_feature_6',
                  'about_feature_7',
                  'about_feature_8',
                ]),
                const SizedBox(height: 16),
                _buildSectionTitle('about_purpose', context),
                _buildSectionContent('about_purpose_text'),
                const SizedBox(height: 16),
                _buildSectionTitle('about_developed_by', context),
                _buildSectionContent('about_developers_text'),
                const SizedBox(height: 16),
                _buildSectionTitle('about_contact', context),
                _buildSectionContent('about_contact_email'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String key, BuildContext context) {
    return Text(
      Intl.message(
        key, 
        name: key, 
        desc: 'Section title: $key',
        args: [],
      ),
      style: AppStyles.style22White(context),
    );
  }

  Widget _buildSectionContent(String key) {
    return Text(
      Intl.message(
        key,
        name: key,
        desc: 'Section content: $key',
        args: [],
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 207, 193, 193),
        height: 1.5,
      ),
    );
  }

  Widget _buildFeatureList(List<String> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: orangeColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        Intl.message(
                          feature,
                          name: feature,
                          desc: 'Feature: $feature',
                          args: [],
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

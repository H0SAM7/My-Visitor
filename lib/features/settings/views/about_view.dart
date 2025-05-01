import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
static String id='AboutView';
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
    leading: CustomBack(),
    
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
                _buildSectionTitle('Name',context),
                _buildSectionContent('Visitor – Your Smart Tourism Companion'),
                const SizedBox(height: 16),
                _buildSectionTitle('Version',context),
                _buildSectionContent('v1.0.0'),
                const SizedBox(height: 16),
                _buildSectionTitle('Description',context),
                _buildSectionContent(
                  'Visitor is an AI-powered tourism app designed to make your travel experience smarter and more convenient. '
                  'From detecting landmarks with your camera to booking hotels and museums, chatting with a smart assistant, '
                  'or translating on the go — all in one place.',
                ),
                const SizedBox(height: 16),
                _buildSectionTitle('Key Features',context),
                _buildFeatureList([
                  'AI-based Landmark Detection',
                  'Smart Chatbot Support',
                  'Hotel and Museum Booking',
                  'Multi-language Translation',
                  'Offline Mode',
                  'Interactive Maps & GPS Navigation',
                  'Personalized Itineraries',
                  'Live Chat Support',
                ]),
                const SizedBox(height: 16),
                _buildSectionTitle('Purpose',context),
                _buildSectionContent(
                  'To enhance your travel experience by combining technology and convenience — letting you explore, '
                  'discover, and connect with new places more intelligently.',
                ),
                const SizedBox(height: 16),
                _buildSectionTitle('Developed by',context),
                _buildSectionContent(
                  'Final Year Graduation Project Team – 2025\n'
                  'Faculty of Computers & AI – [EELU]',
                  
                ),
                const SizedBox(height: 16),
                _buildSectionTitle('Contact',context),
                _buildSectionContent('✉ Email: support@Visitor.app'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title,BuildContext context) {
    return Text(
      title,
      style: AppStyles.style22White(context),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
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
                        feature,
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
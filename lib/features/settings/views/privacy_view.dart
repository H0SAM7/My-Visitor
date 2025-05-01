import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  static String id = 'PrivacyPolicyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        leading: CustomBack(),
        title: Text(
          'Privacy Policy',
          style: AppStyles.style18(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy & Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Last Updated: April 30, 2025',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'At Visitor, your privacy is a top priority. This Privacy Policy explains how we collect, use, and protect your information when using our mobile application.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('📌 Information We Collect:'),
            _buildBulletPoint(
                'Personal Data: Name, email, phone number (during sign-up).'),
            _buildBulletPoint(
                'Location Data: To offer nearby landmarks, navigation, and booking suggestions.'),
            _buildBulletPoint(
                'Device Data: App version, language settings, and device model.'),
            _buildBulletPoint(
                'Booking & Usage History: For better recommendations and support.'),
            const SizedBox(height: 16),
            _buildSectionTitle('🔐 How We Use Your Information:'),
            _buildBulletPoint('To personalize your travel experience.'),
            _buildBulletPoint('To improve app performance and features.'),
            _buildBulletPoint('To process bookings and payments securely.'),
            _buildBulletPoint('To offer support via chatbot or live chat.'),
            const SizedBox(height: 16),
            _buildSectionTitle('❌ Data Sharing:'),
            const Text(
              'We do not sell or share your data with third parties unless required by law or with your explicit consent (e.g., for hotel booking).',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('🛠 Your Rights:'),
            _buildBulletPoint('Access, modify, or delete your data.'),
            _buildBulletPoint('Disable location tracking from settings.'),
            _buildBulletPoint(
                'Contact us at privacy@Visitor.app for data-related inquiries.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/generated/l10n.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  static String id = 'PrivacyPolicyView';
  
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        leading: CustomBack(),
        title: Text(
          s.privacy_policy_title,  
          style: AppStyles.style18(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.privacy_policy_header,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              s.last_updated, 
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              s.privacy_intro_text, 
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(s.information_we_collect),
            _buildBulletPoint(s.personal_data),
            _buildBulletPoint(s.location_data),
            _buildBulletPoint(s.device_data),
            _buildBulletPoint(s.booking_history),
            const SizedBox(height: 16),
            _buildSectionTitle(s.how_we_use_information),
            _buildBulletPoint(s.personalize_travel),
            _buildBulletPoint(s.improve_app_performance),
            _buildBulletPoint(s.process_bookings),
            _buildBulletPoint(s.offer_support),
            const SizedBox(height: 16),
            _buildSectionTitle(s.data_sharing),
            Text(
              s.data_sharing_text, 
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(s.your_rights),
            _buildBulletPoint(s.access_modify_data),
            _buildBulletPoint(s.disable_location_tracking),
            _buildBulletPoint(s.contact_privacy_email),
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

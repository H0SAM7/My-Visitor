import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/features/settings/views/widgets/faqs_data.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});
  static String id = 'FaqsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frequently Asked Questions (FAQs)',
          style: AppStyles.style18(context),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            leading: const Text(
              '❓',
              style: TextStyle(fontSize: 20.0),
            ),
            title: Text(
              faqs[index].question,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
           backgroundColor: const Color(0xFFF5F5F5),
            collapsedBackgroundColor: Colors.white,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  faqs[index].answer,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/features/settings/views/widgets/faqs_data.dart';
import 'package:my_visitor/generated/l10n.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});
  static String id = 'FaqsView';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final faqs = getFaqs(context); 

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          s.faqs,
          style: AppStyles.style18(context),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading:  CustomBack(),
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
                color: Colors.white,
              ),
            ),
            collapsedBackgroundColor: Colors.black,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  faqs[index].answer,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
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

import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/resutrant_list_view.dart';import 'package:my_visitor/core/localization/generated/l10n.dart';

class ResturantsView extends StatelessWidget {
  const ResturantsView({super.key});
  static String id = 'ResturantsView';
  @override
  Widget build(BuildContext context) {
                        final s= S.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        title: Text(
          s.restaurantsNearYou,
          style: AppStyles.style22White(context),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBack(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ResturentsListView(),
          ),
        ],
      ),
    );
  }
}

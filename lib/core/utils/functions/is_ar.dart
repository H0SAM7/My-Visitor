import 'package:flutter/widgets.dart';

bool isArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}
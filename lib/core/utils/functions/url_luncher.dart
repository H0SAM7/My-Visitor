import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlMethod(Uri uri) async {

  if (!await canLaunchUrl(uri)) {
    final bool launched =
        await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      log('Could not launch $uri');
    }
  } else {
    log('Cannot launch URL: $uri');
  }
}
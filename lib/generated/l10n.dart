// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Discover the Wonders of Ancient Egypt`
  String get discoverTitle {
    return Intl.message(
      'Discover the Wonders of Ancient Egypt',
      name: 'discoverTitle',
      desc: 'Main title in onboarding',
      args: [],
    );
  }

  /// `Explore the pyramids, temples, and the tombs of pharaoh`
  String get discoverSubtitle {
    return Intl.message(
      'Explore the pyramids, temples, and the tombs of pharaoh',
      name: 'discoverSubtitle',
      desc: 'Subtitle describing what user will discover',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: 'Button label to start the app',
      args: [],
    );
  }

  /// `Home`
  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: 'App bar title for the Home screen',
      args: [],
    );
  }

  /// `Hotels`
  String get hotelsSectionTitle {
    return Intl.message(
      'Hotels',
      name: 'hotelsSectionTitle',
      desc: 'Section title for hotels',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurantsSectionTitle {
    return Intl.message(
      'Restaurants',
      name: 'restaurantsSectionTitle',
      desc: 'Section title for restaurants',
      args: [],
    );
  }

  /// `Landmarks`
  String get landmarksSectionTitle {
    return Intl.message(
      'Landmarks',
      name: 'landmarksSectionTitle',
      desc: 'Section title for landmarks',
      args: [],
    );
  }

  /// `Welcome to MyVisitor`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to MyVisitor',
      name: 'welcomeMessage',
      desc: 'Greeting message shown on Home screen',
      args: [],
    );
  }

  /// `Explore what's nearby`
  String get exploreNearby {
    return Intl.message(
      'Explore what\'s nearby',
      name: 'exploreNearby',
      desc: 'Prompt for the user to explore nearby locations',
      args: [],
    );
  }

  /// `The Great Pyramid of Giza`
  String get greatPyramidTitle {
    return Intl.message(
      'The Great Pyramid of Giza',
      name: 'greatPyramidTitle',
      desc: 'Title for the Great Pyramid section',
      args: [],
    );
  }

  /// `Giza Necropolis`
  String get gizaNecropolis {
    return Intl.message(
      'Giza Necropolis',
      name: 'gizaNecropolis',
      desc: 'Subtitle for the pyramid location',
      args: [],
    );
  }

  /// `Hotels Near You`
  String get hotelsNearYou {
    return Intl.message(
      'Hotels Near You',
      name: 'hotelsNearYou',
      desc: 'Section title for hotels near the user',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: 'Text button to navigate to full list',
      args: [],
    );
  }

  /// `Restaurants Near You`
  String get restaurantsNearYou {
    return Intl.message(
      'Restaurants Near You',
      name: 'restaurantsNearYou',
      desc: 'Section title for nearby restaurants',
      args: [],
    );
  }

  /// `Popular Now`
  String get Popular_Now {
    return Intl.message(
      'Popular Now',
      name: 'Popular_Now',
      desc: 'Popular Now',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Booking Info`
  String get bookingInfo {
    return Intl.message(
      'Booking Info',
      name: 'bookingInfo',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Support Team`
  String get supportTeam {
    return Intl.message(
      'Support Team',
      name: 'supportTeam',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Translation`
  String get translation {
    return Intl.message(
      'Translation',
      name: 'translation',
      desc: '',
      args: [],
    );
  }

  /// `Ai Assistant`
  String get aiAssistant {
    return Intl.message(
      'Ai Assistant',
      name: 'aiAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

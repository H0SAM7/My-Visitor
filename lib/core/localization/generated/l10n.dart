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

  /// `Personal Info`
  String get personal_info {
    return Intl.message(
      'Personal Info',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load user info`
  String get failed_to_load {
    return Intl.message(
      'Failed to load user info',
      name: 'failed_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load user info`
  String get failed_to_load_user_info {
    return Intl.message(
      'Failed to load user info',
      name: 'failed_to_load_user_info',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_your_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get please_enter_valid_phone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'please_enter_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to save profile`
  String get failed_to_save_profile {
    return Intl.message(
      'Failed to save profile',
      name: 'failed_to_save_profile',
      desc: '',
      args: [],
    );
  }

  /// `Failed to access uploaded image`
  String get failed_to_access_uploaded_image {
    return Intl.message(
      'Failed to access uploaded image',
      name: 'failed_to_access_uploaded_image',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload image`
  String get failed_to_upload_image {
    return Intl.message(
      'Failed to upload image',
      name: 'failed_to_upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions (FAQs)`
  String get faqs_title {
    return Intl.message(
      'Frequently Asked Questions (FAQs)',
      name: 'faqs_title',
      desc: '',
      args: [],
    );
  }

  /// `1. How do I use the image detection feature?`
  String get faq_question_1 {
    return Intl.message(
      '1. How do I use the image detection feature?',
      name: 'faq_question_1',
      desc: '',
      args: [],
    );
  }

  /// `Tap the camera icon in the bottom bar, then point your camera at a landmark. The app will automatically recognize it and display detailed information.`
  String get faq_answer_1 {
    return Intl.message(
      'Tap the camera icon in the bottom bar, then point your camera at a landmark. The app will automatically recognize it and display detailed information.',
      name: 'faq_answer_1',
      desc: '',
      args: [],
    );
  }

  /// `2. Can I make bookings through the app?`
  String get faq_question_2 {
    return Intl.message(
      '2. Can I make bookings through the app?',
      name: 'faq_question_2',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can book hotels, restaurants, and museum tickets directly from the “Booking” section. You’ll receive a confirmation via email.`
  String get faq_answer_2 {
    return Intl.message(
      'Yes, you can book hotels, restaurants, and museum tickets directly from the “Booking” section. You’ll receive a confirmation via email.',
      name: 'faq_answer_2',
      desc: '',
      args: [],
    );
  }

  /// `3. How can I use translation while traveling?`
  String get faq_question_3 {
    return Intl.message(
      '3. How can I use translation while traveling?',
      name: 'faq_question_3',
      desc: '',
      args: [],
    );
  }

  /// `Go to the "Translation" section to type or speak text. The app will instantly translate your input to your preferred language.`
  String get faq_answer_3 {
    return Intl.message(
      'Go to the "Translation" section to type or speak text. The app will instantly translate your input to your preferred language.',
      name: 'faq_answer_3',
      desc: '',
      args: [],
    );
  }

  /// `4. Does the app work offline?`
  String get faq_question_4 {
    return Intl.message(
      '4. Does the app work offline?',
      name: 'faq_question_4',
      desc: '',
      args: [],
    );
  }

  /// `Some features like image detection and translation require internet. However, you can enable “Offline Access” to download maps and basic information for use without a connection.`
  String get faq_answer_4 {
    return Intl.message(
      'Some features like image detection and translation require internet. However, you can enable “Offline Access” to download maps and basic information for use without a connection.',
      name: 'faq_answer_4',
      desc: '',
      args: [],
    );
  }

  /// `5. What does the chatbot do?`
  String get faq_question_5 {
    return Intl.message(
      '5. What does the chatbot do?',
      name: 'faq_question_5',
      desc: '',
      args: [],
    );
  }

  /// `The chatbot helps you with activity suggestions, tourist spots, restaurants, and can answer any questions you have about your trip.`
  String get faq_answer_5 {
    return Intl.message(
      'The chatbot helps you with activity suggestions, tourist spots, restaurants, and can answer any questions you have about your trip.',
      name: 'faq_answer_5',
      desc: '',
      args: [],
    );
  }

  /// `6. How can I change the app language?`
  String get faq_question_6 {
    return Intl.message(
      '6. How can I change the app language?',
      name: 'faq_question_6',
      desc: '',
      args: [],
    );
  }

  /// `Go to “Settings” > “Language” and choose your preferred language. The app content will update automatically.`
  String get faq_answer_6 {
    return Intl.message(
      'Go to “Settings” > “Language” and choose your preferred language. The app content will update automatically.',
      name: 'faq_answer_6',
      desc: '',
      args: [],
    );
  }

  /// `7. Is my personal data safe?`
  String get faq_question_7 {
    return Intl.message(
      '7. Is my personal data safe?',
      name: 'faq_question_7',
      desc: '',
      args: [],
    );
  }

  /// `Yes, your data is protected with strong encryption and we strictly follow our privacy policy.`
  String get faq_answer_7 {
    return Intl.message(
      'Yes, your data is protected with strong encryption and we strictly follow our privacy policy.',
      name: 'faq_answer_7',
      desc: '',
      args: [],
    );
  }

  /// `8. What should I do if I face an issue with a booking?`
  String get faq_question_8 {
    return Intl.message(
      '8. What should I do if I face an issue with a booking?',
      name: 'faq_question_8',
      desc: '',
      args: [],
    );
  }

  /// `You can contact our support team through the “Support & Help” section or use the in-app live chat feature.`
  String get faq_answer_8 {
    return Intl.message(
      'You can contact our support team through the “Support & Help” section or use the in-app live chat feature.',
      name: 'faq_answer_8',
      desc: '',
      args: [],
    );
  }

  /// `9. Do I need an account to use the app?`
  String get faq_question_9 {
    return Intl.message(
      '9. Do I need an account to use the app?',
      name: 'faq_question_9',
      desc: '',
      args: [],
    );
  }

  /// `Some features are available without an account, but for booking and saving your activities, we recommend signing up.`
  String get faq_answer_9 {
    return Intl.message(
      'Some features are available without an account, but for booking and saving your activities, we recommend signing up.',
      name: 'faq_answer_9',
      desc: '',
      args: [],
    );
  }

  /// `10. How can I update my personal information or password?`
  String get faq_question_10 {
    return Intl.message(
      '10. How can I update my personal information or password?',
      name: 'faq_question_10',
      desc: '',
      args: [],
    );
  }

  /// `Go to “Account Settings” to edit your name, profile photo, phone number, or change your password at any time.`
  String get faq_answer_10 {
    return Intl.message(
      'Go to “Account Settings” to edit your name, profile photo, phone number, or change your password at any time.',
      name: 'faq_answer_10',
      desc: '',
      args: [],
    );
  }

  /// `11. Can I save my favorite places?`
  String get faq_question_11 {
    return Intl.message(
      '11. Can I save my favorite places?',
      name: 'faq_question_11',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can tap the heart icon on any place to add it to your “Favorites” list for quick access later.`
  String get faq_answer_11 {
    return Intl.message(
      'Yes, you can tap the heart icon on any place to add it to your “Favorites” list for quick access later.',
      name: 'faq_answer_11',
      desc: '',
      args: [],
    );
  }

  /// `12. How can I view my booking history?`
  String get faq_question_12 {
    return Intl.message(
      '12. How can I view my booking history?',
      name: 'faq_question_12',
      desc: '',
      args: [],
    );
  }

  /// `Go to “Settings” > “Booking History” to view all your past hotel, restaurant, and museum reservations.`
  String get faq_answer_12 {
    return Intl.message(
      'Go to “Settings” > “Booking History” to view all your past hotel, restaurant, and museum reservations.',
      name: 'faq_answer_12',
      desc: '',
      args: [],
    );
  }

  /// `13. What if the app doesn’t detect a landmark correctly?`
  String get faq_question_13 {
    return Intl.message(
      '13. What if the app doesn’t detect a landmark correctly?',
      name: 'faq_question_13',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the camera has a clear view and proper lighting. If the issue continues, report it via “Support & Feedback”.`
  String get faq_answer_13 {
    return Intl.message(
      'Make sure the camera has a clear view and proper lighting. If the issue continues, report it via “Support & Feedback”.',
      name: 'faq_answer_13',
      desc: '',
      args: [],
    );
  }

  /// `14. How do I enable or disable notifications?`
  String get faq_question_14 {
    return Intl.message(
      '14. How do I enable or disable notifications?',
      name: 'faq_question_14',
      desc: '',
      args: [],
    );
  }

  /// `Go to “Settings” > “Notifications” to manage alerts for bookings, offers, or travel updates.`
  String get faq_answer_14 {
    return Intl.message(
      'Go to “Settings” > “Notifications” to manage alerts for bookings, offers, or travel updates.',
      name: 'faq_answer_14',
      desc: '',
      args: [],
    );
  }

  /// `15. Is the app available in multiple languages?`
  String get faq_question_15 {
    return Intl.message(
      '15. Is the app available in multiple languages?',
      name: 'faq_question_15',
      desc: '',
      args: [],
    );
  }

  /// `Yes, the app supports several languages. You can change your preferred language in the “Language” settings.`
  String get faq_answer_15 {
    return Intl.message(
      'Yes, the app supports several languages. You can change your preferred language in the “Language” settings.',
      name: 'faq_answer_15',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get about_name {
    return Intl.message(
      'Name',
      name: 'about_name',
      desc: '',
      args: [],
    );
  }

  /// `Visitor – Your Smart Tourism Companion`
  String get about_app_name {
    return Intl.message(
      'Visitor – Your Smart Tourism Companion',
      name: 'about_app_name',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get about_version {
    return Intl.message(
      'Version',
      name: 'about_version',
      desc: '',
      args: [],
    );
  }

  /// `v1.0.0`
  String get about_version_number {
    return Intl.message(
      'v1.0.0',
      name: 'about_version_number',
      desc: '',
      args: [],
    );
  }

  /// `Visitor is an AI-powered tourism app designed to make your travel experience smarter and more convenient. From detecting landmarks with your camera to booking hotels and museums, chatting with a smart assistant, or translating on the go — all in one place.`
  String get about_description {
    return Intl.message(
      'Visitor is an AI-powered tourism app designed to make your travel experience smarter and more convenient. From detecting landmarks with your camera to booking hotels and museums, chatting with a smart assistant, or translating on the go — all in one place.',
      name: 'about_description',
      desc: '',
      args: [],
    );
  }

  /// `Key Features`
  String get about_key_features {
    return Intl.message(
      'Key Features',
      name: 'about_key_features',
      desc: '',
      args: [],
    );
  }

  /// `AI-based Landmark Detection`
  String get about_feature_1 {
    return Intl.message(
      'AI-based Landmark Detection',
      name: 'about_feature_1',
      desc: '',
      args: [],
    );
  }

  /// `Smart Chatbot Support`
  String get about_feature_2 {
    return Intl.message(
      'Smart Chatbot Support',
      name: 'about_feature_2',
      desc: '',
      args: [],
    );
  }

  /// `Hotel and Museum Booking`
  String get about_feature_3 {
    return Intl.message(
      'Hotel and Museum Booking',
      name: 'about_feature_3',
      desc: '',
      args: [],
    );
  }

  /// `Multi-language Translation`
  String get about_feature_4 {
    return Intl.message(
      'Multi-language Translation',
      name: 'about_feature_4',
      desc: '',
      args: [],
    );
  }

  /// `Offline Mode`
  String get about_feature_5 {
    return Intl.message(
      'Offline Mode',
      name: 'about_feature_5',
      desc: '',
      args: [],
    );
  }

  /// `Interactive Maps & GPS Navigation`
  String get about_feature_6 {
    return Intl.message(
      'Interactive Maps & GPS Navigation',
      name: 'about_feature_6',
      desc: '',
      args: [],
    );
  }

  /// `Personalized Itineraries`
  String get about_feature_7 {
    return Intl.message(
      'Personalized Itineraries',
      name: 'about_feature_7',
      desc: '',
      args: [],
    );
  }

  /// `Live Chat Support`
  String get about_feature_8 {
    return Intl.message(
      'Live Chat Support',
      name: 'about_feature_8',
      desc: '',
      args: [],
    );
  }

  /// `Purpose`
  String get about_purpose {
    return Intl.message(
      'Purpose',
      name: 'about_purpose',
      desc: '',
      args: [],
    );
  }

  /// `To enhance your travel experience by combining technology and convenience — letting you explore, discover, and connect with new places more intelligently.`
  String get about_purpose_text {
    return Intl.message(
      'To enhance your travel experience by combining technology and convenience — letting you explore, discover, and connect with new places more intelligently.',
      name: 'about_purpose_text',
      desc: '',
      args: [],
    );
  }

  /// `Developed by`
  String get about_developed_by {
    return Intl.message(
      'Developed by',
      name: 'about_developed_by',
      desc: '',
      args: [],
    );
  }

  /// `Final Year Graduation Project Team – 2025\nFaculty of Computers & AI – [EELU]`
  String get about_developers_text {
    return Intl.message(
      'Final Year Graduation Project Team – 2025\nFaculty of Computers & AI – [EELU]',
      name: 'about_developers_text',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get about_contact {
    return Intl.message(
      'Contact',
      name: 'about_contact',
      desc: '',
      args: [],
    );
  }

  /// `✉ Email: support@Visitor.app`
  String get about_contact_email {
    return Intl.message(
      '✉ Email: support@Visitor.app',
      name: 'about_contact_email',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy_title {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy_title',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get privacy_policy_header {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacy_policy_header',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated: April 30, 2025`
  String get last_updated {
    return Intl.message(
      'Last Updated: April 30, 2025',
      name: 'last_updated',
      desc: '',
      args: [],
    );
  }

  /// `At Visitor, your privacy is a top priority. This Privacy Policy explains how we collect, use, and protect your information when using our mobile application.`
  String get privacy_intro_text {
    return Intl.message(
      'At Visitor, your privacy is a top priority. This Privacy Policy explains how we collect, use, and protect your information when using our mobile application.',
      name: 'privacy_intro_text',
      desc: '',
      args: [],
    );
  }

  /// `📌 Information We Collect:`
  String get information_we_collect {
    return Intl.message(
      '📌 Information We Collect:',
      name: 'information_we_collect',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data: Name, email, phone number (during sign-up).`
  String get personal_data {
    return Intl.message(
      'Personal Data: Name, email, phone number (during sign-up).',
      name: 'personal_data',
      desc: '',
      args: [],
    );
  }

  /// `Location Data: To offer nearby landmarks, navigation, and booking suggestions.`
  String get location_data {
    return Intl.message(
      'Location Data: To offer nearby landmarks, navigation, and booking suggestions.',
      name: 'location_data',
      desc: '',
      args: [],
    );
  }

  /// `Device Data: App version, language settings, and device model.`
  String get device_data {
    return Intl.message(
      'Device Data: App version, language settings, and device model.',
      name: 'device_data',
      desc: '',
      args: [],
    );
  }

  /// `Booking & Usage History: For better recommendations and support.`
  String get booking_history {
    return Intl.message(
      'Booking & Usage History: For better recommendations and support.',
      name: 'booking_history',
      desc: '',
      args: [],
    );
  }

  /// `🔐 How We Use Your Information:`
  String get how_we_use_information {
    return Intl.message(
      '🔐 How We Use Your Information:',
      name: 'how_we_use_information',
      desc: '',
      args: [],
    );
  }

  /// `To personalize your travel experience.`
  String get personalize_travel {
    return Intl.message(
      'To personalize your travel experience.',
      name: 'personalize_travel',
      desc: '',
      args: [],
    );
  }

  /// `To improve app performance and features.`
  String get improve_app_performance {
    return Intl.message(
      'To improve app performance and features.',
      name: 'improve_app_performance',
      desc: '',
      args: [],
    );
  }

  /// `To process bookings and payments securely.`
  String get process_bookings {
    return Intl.message(
      'To process bookings and payments securely.',
      name: 'process_bookings',
      desc: '',
      args: [],
    );
  }

  /// `To offer support via chatbot or live chat.`
  String get offer_support {
    return Intl.message(
      'To offer support via chatbot or live chat.',
      name: 'offer_support',
      desc: '',
      args: [],
    );
  }

  /// `❌ Data Sharing:`
  String get data_sharing {
    return Intl.message(
      '❌ Data Sharing:',
      name: 'data_sharing',
      desc: '',
      args: [],
    );
  }

  /// `We do not sell or share your data with third parties unless required by law or with your explicit consent (e.g., for hotel booking).`
  String get data_sharing_text {
    return Intl.message(
      'We do not sell or share your data with third parties unless required by law or with your explicit consent (e.g., for hotel booking).',
      name: 'data_sharing_text',
      desc: '',
      args: [],
    );
  }

  /// `🛠 Your Rights:`
  String get your_rights {
    return Intl.message(
      '🛠 Your Rights:',
      name: 'your_rights',
      desc: '',
      args: [],
    );
  }

  /// `Access, modify, or delete your data.`
  String get access_modify_data {
    return Intl.message(
      'Access, modify, or delete your data.',
      name: 'access_modify_data',
      desc: '',
      args: [],
    );
  }

  /// `Disable location tracking from settings.`
  String get disable_location_tracking {
    return Intl.message(
      'Disable location tracking from settings.',
      name: 'disable_location_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Contact us at privacy@Visitor.app for data-related inquiries.`
  String get contact_privacy_email {
    return Intl.message(
      'Contact us at privacy@Visitor.app for data-related inquiries.',
      name: 'contact_privacy_email',
      desc: '',
      args: [],
    );
  }

  /// `Support Team`
  String get chat_view_title {
    return Intl.message(
      'Support Team',
      name: 'chat_view_title',
      desc: '',
      args: [],
    );
  }

  /// `Typically replies within 5 minutes`
  String get chat_view_reply_time {
    return Intl.message(
      'Typically replies within 5 minutes',
      name: 'chat_view_reply_time',
      desc: '',
      args: [],
    );
  }

  /// `Translation`
  String get translate_title {
    return Intl.message(
      'Translation',
      name: 'translate_title',
      desc: '',
      args: [],
    );
  }

  /// `Type here...`
  String get type_here {
    return Intl.message(
      'Type here...',
      name: 'type_here',
      desc: '',
      args: [],
    );
  }

  /// `Resturants Near You`
  String get ResturantsNearYou {
    return Intl.message(
      'Resturants Near You',
      name: 'ResturantsNearYou',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Go Now`
  String get goNow {
    return Intl.message(
      'Go Now',
      name: 'goNow',
      desc: '',
      args: [],
    );
  }

  /// `Explorer`
  String get Explorer {
    return Intl.message(
      'Explorer',
      name: 'Explorer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to open this Menu`
  String get AreyousureyouwanttoopenthisMenu {
    return Intl.message(
      'Are you sure you want to open this Menu',
      name: 'AreyousureyouwanttoopenthisMenu',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `No reviews available.`
  String get noReviews {
    return Intl.message(
      'No reviews available.',
      name: 'noReviews',
      desc: '',
      args: [],
    );
  }

  /// `Detection Image Result`
  String get detection {
    return Intl.message(
      'Detection Image Result',
      name: 'detection',
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

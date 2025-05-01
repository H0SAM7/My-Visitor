
final List<FAQ> faqs = const [
    FAQ(
      question: '1. How do I use the image detection feature?',
      answer: 'Tap the camera icon in the bottom bar, then point your camera at a landmark. The app will automatically recognize it and display detailed information.',
    ),
    FAQ(
      question: '2. Can I make bookings through the app?',
      answer: 'Yes, you can book hotels, restaurants, and museum tickets directly from the “Booking” section. You’ll receive a confirmation via email.',
    ),
    FAQ(
      question: '3. How can I use translation while traveling?',
      answer: 'Go to the "Translation" section to type or speak text. The app will instantly translate your input to your preferred language.',
    ),
    FAQ(
      question: '4. Does the app work offline?',
      answer: 'Some features like image detection and translation require internet. However, you can enable “Offline Access” to download maps and basic information for use without a connection.',
    ),
    FAQ(
      question: '5. What does the chatbot do?',
      answer: 'The chatbot helps you with activity suggestions, tourist spots, restaurants, and can answer any questions you have about your trip.',
    ),
    FAQ(
      question: '6. How can I change the app language?',
      answer: 'Go to “Settings” > “Language” and choose your preferred language. The app content will update automatically.',
    ),
    FAQ(
      question: '7. Is my personal data safe?',
      answer: 'Yes, your data is protected with strong encryption and we strictly follow our privacy policy.',
    ),
    FAQ(
      question: '8. What should I do if I face an issue with a booking?',
      answer: 'You can contact our support team through the “Support & Help” section or use the in-app live chat feature.',
    ),
    FAQ(
      question: '9. Do I need an account to use the app?',
      answer: 'Some features are available without an account, but for booking and saving your activities, we recommend signing up.',
    ),
    FAQ(
      question: '10. How can I update my personal information or password?',
      answer: 'Go to “Account Settings” to edit your name, profile photo, phone number, or change your password at any time.',
    ),
    FAQ(
      question: '11. Can I save my favorite places?',
      answer: 'Yes, you can tap the heart icon on any place to add it to your “Favorites” list for quick access later.',
    ),
    FAQ(
      question: '12. How can I view my booking history?',
      answer: 'Go to “Settings” > “Booking History” to view all your past hotel, restaurant, and museum reservations.',
    ),
    FAQ(
      question: '13. What if the app doesn’t detect a landmark correctly?',
      answer: 'Make sure the camera has a clear view and proper lighting. If the issue continues, report it via “Support & Feedback”.',
    ),
    FAQ(
      question: '14. How do I enable or disable notifications?',
      answer: 'Go to “Settings” > “Notifications” to manage alerts for bookings, offers, or travel updates.',
    ),
    FAQ(
      question: '15. Is the app available in multiple languages?',
      answer: 'Yes, the app supports several languages. You can change your preferred language in the “Language” settings.',
    ),
  ];
class FAQ {
  final String question;
  final String answer;

  const FAQ({required this.question, required this.answer});
}
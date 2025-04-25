// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/chat_message.dart';
// import '../widgets/chat_bubble.dart';
// import '../services/ai_service.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   final List<ChatMessage> _messages = [];

//   late AIService _aiService;
//   bool _isLoading = false;
//   String _currentCity = '';
//   String _currentLanguage = 'en';

//   final Map<String, String> _systemPrompts = {
//     'ar': '''
// أنت مرشد سياحي مصري محترف. يجب عليك:
// 1. تذكر التفاصيل السابقة في المحادثة
// 2. عدم طلب معلومات قد سبق للمستخدم تقديمها
// 3. الربط بين الأسئلة المتتابعة بشكل منطقي
// 4. إذا طلب المستخدم معلومات محددة (مثل مدينة معينة)، استخدم هذه المعلومة في جميع الردود اللاحقة ما لم يذكر غير ذلك

// مثال:
// السائح: "أريد مطعماً في الجيزة"
// المرشد: "هناك العديد من المطاعم الرائعة في الجيزة مثل..."
// السائح: "أين موقع أبو شقرا؟"
// المرشد: "فروع أبو شقرا في الجيزة هي..."
// ''',
//     'en': '''
// You are a professional Egyptian tour guide. You must:
// 1. Remember previous conversation details
// 2. Never ask for information already provided by the user
// 3. Connect sequential questions logically
// 4. If user specifies a location (like a city), use it in all subsequent responses unless stated otherwise

// Example:
// Tourist: "I want a restaurant in Giza"
// Guide: "There are many great restaurants in Giza like..."
// Tourist: "Where is Abu Shakra located?"
// Guide: "Abu Shakra branches in Giza are..."
// '''
//   };

//   @override
//   void initState() {
//     super.initState();
//     _initAI();
//     _addWelcomeMessage();
//   }

//   void _initAI() {
//     _aiService = AIService(
//       'AIzaSyDO53KasZKKrV5s0zVxp2XIGfsZQysQVC8',
//       _systemPrompts[_currentLanguage]!,
//     );
//   }

//   void _addWelcomeMessage() {
//     final welcomeMessages = {
//       'ar': "مرحباً بكم في الدليل السياحي لمصر! كيف يمكنني مساعدتكم اليوم؟",
//       'en': "Welcome to Visitor App Guide! How can I assist you today?"
//     };

//     _messages.add(ChatMessage(
//       text: "${welcomeMessages['ar']}\n\n${welcomeMessages['en']}",
//       isUser: false,
//       time: _getCurrentTime(),
//     ));
//   }

//   Future<void> _sendMessage() async {
//     final message = _messageController.text.trim();
//     if (message.isEmpty || _isLoading) return;

//     setState(() {
//       _messages.add(ChatMessage(
//         text: message,
//         isUser: true,
//         time: _getCurrentTime(),
//       ));
//       _messageController.clear();
//       _isLoading = true;
//     });

//     _scrollToBottom();

//     try {
//       _currentLanguage = _isArabic(message) ? 'ar' : 'en';

//       final extractedCity = _extractCity(message);
//       if (extractedCity.isNotEmpty) {
//         _currentCity = extractedCity;
//       }

//       final prompt = '''
// ${_systemPrompts[_currentLanguage]}

// ${_currentCity.isNotEmpty ? 'الموقع الحالي/Current Location: $_currentCity' : ''}

// السائح/Tourist: $message
// المرشد/Guide:
// ''';

//       final response = await _aiService.sendMessage(prompt);

//       setState(() {
//         _messages.add(ChatMessage(
//           text: response.isNotEmpty
//               ? response
//               : (_currentLanguage == 'ar'
//                   ? "لم أتمكن من توليد رد. حاول مرة أخرى."
//                   : "I couldn't generate a response. Please try again."),
//           isUser: false,
//           time: _getCurrentTime(),
//         ));
//         _isLoading = false;
//       });
//     } catch (_) {
//       setState(() {
//         _messages.add(ChatMessage(
//           text: _currentLanguage == 'ar'
//               ? "عذراً، حدث خطأ. يرجى المحاولة لاحقاً."
//               : "Sorry, an error occurred. Please try again later.",
//           isUser: false,
//           time: _getCurrentTime(),
//         ));
//         _isLoading = false;
//       });
//     }

//     _scrollToBottom();
//   }

//   bool _isArabic(String text) {
//     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
//   }

//   String _extractCity(String text) {
//     final cities = ['الجيزة', 'القاهرة', 'الإسكندرية', 'الأقصر', 'أسوان', 'giza', 'cairo', 'alexandria', 'luxor', 'aswan'];
//     for (final city in cities) {
//       if (text.toLowerCase().contains(city.toLowerCase())) {
//         return city;
//       }
//     }
//     return '';
//   }

//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   String _getCurrentTime() {
//     return DateFormat('HH:mm').format(DateTime.now());
//   }

//   Widget _buildInputField() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           Expanded(
//   child: TextField(
//     controller: _messageController,
//     style: const TextStyle(color: Colors.white), // لون النص أثناء الكتابة
//     decoration: InputDecoration(
//       hintText: _currentLanguage == 'ar'
//           ? 'اسأل عن السياحة المصرية...'
//           : 'Ask about Egyptian tourism...',
//       hintStyle: const TextStyle(color: Colors.white), // لون الـ hint
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(24),
//       ),
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 12,
//       ),
//     ),
//     onSubmitted: (_) => _sendMessage(),
//   ),
// ),

//           const SizedBox(width: 8),
//           CircleAvatar(
//             backgroundColor: Colors.deepOrange,
//             child: IconButton(
//               icon: const Icon(Icons.send, color: Colors.white),
//               onPressed: _sendMessage,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
      
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(16),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return ChatBubble(message: _messages[index]);
//               },
//             ),
//           ),
//           if (_isLoading)
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8),
//               child: CircularProgressIndicator(),
//             ),
//           _buildInputField(),
//         ],
//       ),
//     );
//   }
// }

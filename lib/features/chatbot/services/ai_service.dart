import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  final GenerativeModel _model;
  late final ChatSession _chatSession;

  AIService(String apiKey, String systemPrompt)
      : _model = GenerativeModel(
          model: 'gemini-2.0-flash',
          apiKey: apiKey,
          generationConfig: GenerationConfig(
            temperature: 0.3,
            maxOutputTokens: 500,
          ),
        ) {
    _chatSession = _model.startChat(
      history: [Content.text(systemPrompt)],
    );
  }

  Future<String> sendMessage(String prompt) async {
    final response = await _chatSession.sendMessage(Content.text(prompt));
    return response.text ?? '';
  }
}

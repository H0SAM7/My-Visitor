import 'package:flutter/material.dart';
import 'package:translator/translator.dart' as translator;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/services.dart';

class TranslatedContent extends StatefulWidget {
  final String originalTitle;
  final String originalText;

  const TranslatedContent({
    required this.originalTitle,
    required this.originalText,
  });

  @override
  State<TranslatedContent> createState() => _TranslatedContentState();
}

class _TranslatedContentState extends State<TranslatedContent> {
  final translator.GoogleTranslator _translator = translator.GoogleTranslator();
  final FlutterTts flutterTts = FlutterTts();

  String selectedLanguage = 'en';
  String displayedTitle = '';
  String displayedText = '';
  bool isTranslating = false;

  final Map<String, String> languageMap = {
    'en': 'English',
    'ar': 'Arabic',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'hi': 'Hindi',
    'pt': 'Portuguese',
    'ru': 'Russian',
  };

  @override
  void initState() {
    super.initState();
    displayedTitle = widget.originalTitle;
    displayedText = widget.originalText;
  }
  @override
  void dispose() {
    flutterTts.stop(); // ✅ إيقاف الصوت عند الخروج
    super.dispose();
  }

  Future<void> _translateText(String langCode) async {
    setState(() => isTranslating = true);

    try {
      final translatedTitle = await _translator.translate(widget.originalTitle, to: langCode);
      final translatedText = await _translator.translate(widget.originalText, to: langCode);

      setState(() {
        selectedLanguage = langCode;
        displayedTitle = translatedTitle.text;
        displayedText = translatedText.text;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Translation failed. Please try again.')),
      );
    }

    setState(() => isTranslating = false);
  }

  Future<void> _speak() async {
    await flutterTts.setLanguage(selectedLanguage);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak("$displayedTitle: $displayedText");
  }

  Future<void> _stopSpeaking() async {
    await flutterTts.stop();
  }

  Future<void> _copyText() async {
    await Clipboard.setData(ClipboardData(text: "$displayedTitle: $displayedText"));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Text copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double baseFontSize = size.width * 0.045; 
    final double titleFontSize = baseFontSize + 4;
    final double textFontSize = baseFontSize;
    final double paddingValue = size.width * 0.05;

    TextDirection textDirection =
        ['ar', 'fa', 'he', 'ur'].contains(selectedLanguage)
            ? TextDirection.rtl
            : TextDirection.ltr;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Align(
              alignment: textDirection == TextDirection.rtl
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: DropdownButton<String>(
                value: selectedLanguage,
                icon: const Icon(Icons.language, color: Colors.white),
                dropdownColor: Colors.black,
                underline: const SizedBox(),
                onChanged: (String? newLang) {
                  if (newLang != null) {
                    _translateText(newLang);
                  }
                },
                items: languageMap.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.key,
                    child: Text(
                      entry.value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            
            Row(
              mainAxisAlignment: textDirection == TextDirection.rtl
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "$displayedTitle :",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textDirection: textDirection,
                  ),
                ),
                IconButton(
                  tooltip: "Speak",
                  onPressed: _speak,
                  icon: const Icon(Icons.volume_up, color: Colors.white),
                ),
                IconButton(
                  tooltip: "Stop",
                  onPressed: _stopSpeaking,
                  icon: const Icon(Icons.stop, color: Colors.white),
                ),
                IconButton(
                  tooltip: "Copy",
                  onPressed: _copyText,
                  icon: const Icon(Icons.copy, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (isTranslating)
              const Center(child: CircularProgressIndicator())
            else
              Text(
                displayedText,
                style: TextStyle(
                  fontSize: textFontSize,
                  color: Colors.white,
                ),
                textDirection: textDirection,
              ),
          ],
        ),
      ),
    );
  }
}

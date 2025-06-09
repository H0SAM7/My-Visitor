import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_app_bar.dart';import 'package:my_visitor/core/localization/generated/l10n.dart';
import 'package:translator/translator.dart' as translator;

class TranslationView extends StatefulWidget {
  const TranslationView({super.key});
  static String id = 'TranslationView';

  @override
  State<TranslationView> createState() => _TranslationViewState();
}

class _TranslationViewState extends State<TranslationView> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  final translator.GoogleTranslator _translator = translator.GoogleTranslator();

  String selectedFrom = 'en';
  String selectedTo = 'es'; // Changed default from 'id' to 'es'

  String _lastInput = '';
  String _lastFrom = '';
  String _lastTo = '';

  final Map<String, String> languageMap = {
    'en': 'English',
    'ar': 'Arabic',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'zh': 'Chinese',
    'hi': 'Hindi',
    'pt': 'Portuguese',
    'ru': 'Russian',
  };

  @override
  void initState() {
    super.initState();
    inputController.addListener(_translateText);
  }

  Future<void> _translateText() async {
    final currentInput = inputController.text.trim();
    if (currentInput.isEmpty ||
        (currentInput == _lastInput &&
            selectedFrom == _lastFrom &&
            selectedTo == _lastTo)) return;

    _lastInput = currentInput;
    _lastFrom = selectedFrom;
    _lastTo = selectedTo;

    try {
      final result = await _translator.translate(
        currentInput,
        from: selectedFrom,
        to: selectedTo,
      );
      setState(() {
        outputController.text = result.text;
      });
    } catch (e) {
      log('Translation error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Translation failed. Please try again.")),
      );
    }
  }

  void _swapLanguages() {
    setState(() {
      final temp = selectedFrom;
      selectedFrom = selectedTo;
      selectedTo = temp;
    });
    _translateText();
  }

  @override
  void dispose() {
    inputController.dispose();
    outputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CustomAppBar(title: s.translate_title),
            _buildLanguageSelector(),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            _TextCard(
              controller: inputController,
              hint: s.type_here,
              showCharCount: true,
            ),
            const SizedBox(height: 20),
            _TextCard(
              controller: outputController,
              hint: s.translation,
              enabled: false,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _translateText,
              child: Text(
                s.translation,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _LanguageDropdown(
          value: selectedFrom,
          onChanged: (String? value) {
            if (value != null) {
              setState(() => selectedFrom = value);
              _translateText();
            }
          },
          languageMap: languageMap,
        ),
        IconButton(
          icon: Icon(Icons.swap_horiz, size: 28, color: orangeColor),
          onPressed: _swapLanguages,
        ),
        _LanguageDropdown(
          value: selectedTo,
          onChanged: (String? value) {
            if (value != null) {
              setState(() => selectedTo = value);
              _translateText();
            }
          },
          languageMap: languageMap,
        ),
      ],
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final Map<String, String> languageMap;

  const _LanguageDropdown({
    required this.value,
    required this.onChanged,
    required this.languageMap,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      underline: const SizedBox(),
      icon: Icon(Icons.arrow_drop_down, color: orangeColor),
      items: languageMap.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Row(
            children: [
              Image.asset(
                Assets.imagesBackground,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(entry.value),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class _TextCard extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool enabled;
  final bool showCharCount;

  const _TextCard({
    required this.controller,
    required this.hint,
    this.enabled = true,
    this.showCharCount = false,
  });

  @override
  State<_TextCard> createState() => _TextCardState();
}

class _TextCardState extends State<_TextCard> {
  final FlutterTts flutterTts = FlutterTts();

  // Mapping of app language codes to TTS language codes
  final Map<String, String> ttsLanguageMap = {
    'en': 'en-US',
    'ar': 'ar-SA',
    'es': 'es-ES',
    'fr': 'fr-FR',
    'de': 'de-DE',
    'zh': 'zh-CN',
    'hi': 'hi-IN',
    'pt': 'pt-PT',
    'ru': 'ru-RU',
  };

  Future<void> _speak() async {
    if (widget.controller.text.trim().isNotEmpty) {
      // Determine which language to use based on the controller
      String languageCode = widget.controller == widget.controller
          ? (context.findAncestorStateOfType<_TranslationViewState>()?.selectedFrom ?? 'en')
          : (context.findAncestorStateOfType<_TranslationViewState>()?.selectedTo ?? 'es');

      // Get the TTS language code
      String? ttsLanguage = ttsLanguageMap[languageCode];

      if (ttsLanguage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('TTS not supported for ${languageCode.toUpperCase()}')),
        );
        return;
      }

      try {
        // Check if the language is supported by the TTS engine
        List<dynamic> languages = await flutterTts.getLanguages;
        if (!languages.contains(ttsLanguage)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('TTS language $ttsLanguage not available')),
          );
          return;
        }

        // Set the language and speak
        await flutterTts.setLanguage(ttsLanguage);
        await flutterTts.setPitch(1.0);
        await flutterTts.speak(widget.controller.text.trim());
      } catch (e) {
        log('TTS error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to use text-to-speech')),
        );
      }
    }
  }

  Future<void> _copyToClipboard() async {
    if (widget.controller.text.trim().isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: widget.controller.text.trim()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to clipboard')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: widget.controller,
            enabled: widget.enabled,
            maxLines: null,
            maxLength: 5000,
            decoration: InputDecoration.collapsed(hintText: widget.hint),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          if (widget.showCharCount)
            Text(
              "${widget.controller.text.length} / 5000",
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_up, size: 20, color: Colors.black),
                onPressed: _speak,
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.copy, size: 20, color: Colors.black),
                onPressed: _copyToClipboard,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
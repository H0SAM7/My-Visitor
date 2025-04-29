import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:translator/translator.dart' as translator;


class TranslationView extends StatefulWidget {
  const TranslationView({super.key});
static String id='TranslationView';
  @override
  State<TranslationView> createState() => _TranslationViewState();
}

class _TranslationViewState extends State<TranslationView> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  final translator.GoogleTranslator _translator = translator.GoogleTranslator();

  String selectedFrom = 'en';
  String selectedTo = 'id';

  String _lastInput = '';
  String _lastFrom = '';
  String _lastTo = '';

  final Map<String, String> languageMap = {
    'en': 'USA',
    'id': 'Indonesia',
    'ar': 'Arabic',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildLanguageSelector(),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Translate",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            _TextCard(
              controller: inputController,
              hint: "Type here...",
              showCharCount: true,
            ),
            const SizedBox(height: 20),
            _TextCard(
              controller: outputController,
              hint: "Translation...",
              enabled: false,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color.fromARGB(255, 4, 68, 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _translateText,
              child: const Text(
                "Translate",
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
          icon: const Icon(Icons.swap_horiz, size: 28),
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
      icon: const Icon(Icons.arrow_drop_down),
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

  Future<void> _speak() async {
    if (widget.controller.text.trim().isNotEmpty) {
      await flutterTts.setLanguage("en-US");
      await flutterTts.speak(widget.controller.text.trim());
    }
  }

  Future<void> _copyToClipboard() async {
    if (widget.controller.text.trim().isNotEmpty) {
      await Clipboard.setData(
          ClipboardData(text: widget.controller.text.trim()));
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
        color: Colors.grey[200],
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
            style: const TextStyle(fontSize: 16),
          ),
          if (widget.showCharCount)
            Text(
              "${widget.controller.text.length} / 5000",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_up, size: 20),
                onPressed: _speak,
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.copy, size: 20),
                onPressed: _copyToClipboard,
              ),
            ],
          )
        ],
      ),
    );
  }
}

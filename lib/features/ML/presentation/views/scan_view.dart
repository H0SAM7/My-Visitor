import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:my_visitor/features/ML/presentation/views/detection_view.dart';
import 'package:my_visitor/features/ML/presentation/views/ml_view.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});
  static String id = 'ScanView';

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  File? _imageFile;
  Uint8List? _imageBytes;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    if (kIsWeb) {
      Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageFile = null;
      });
      navigateToResultScreen(bytes, null);
    } else {
      File file = File(pickedFile.path);
      setState(() {
        _imageFile = file;
        _imageBytes = null;
      });
      navigateToResultScreen(null, file);
    }
  }

  void navigateToResultScreen(Uint8List? bytes, File? file) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetectionView(imageBytes: bytes, imageFile: file),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.imagesImageScan,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(Assets.imagesScanRecan),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45.0),
              child: IconButton(
                onPressed: pickImage,
                icon: Image.asset(
                  Assets.imagesScanButton,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

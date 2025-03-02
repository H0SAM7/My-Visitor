import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'dart:io';
import 'package:flutter/foundation.dart'; // Needed for kIsWeb
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
class MLView extends StatefulWidget {
  const MLView({super.key});
  static String id = 'MLView';

  @override
  State<MLView> createState() => _MLViewState();
}

class _MLViewState extends State<MLView> {
  File? _imageFile;
  Uint8List? _imageBytes; // For Web
  final picker = ImagePicker();
  String _result = "No results yet";
  final Dio _dio = Dio();

  Future<void> uploadImage() async {
    if (_imageFile == null && _imageBytes == null) return;

    String url = kIsWeb
        ? "http://127.0.0.1:5000/predict" // For web
        : "http://10.0.2.2:5000/predict"; // For emulator

    FormData formData;
    if (kIsWeb && _imageBytes != null) {
      formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(_imageBytes!, filename: 'upload.png'),
      });
    } else if (_imageFile != null) {
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(_imageFile!.path, filename: 'upload.png'),
      });
    } else {
      return;
    }

    try {
      Response response = await _dio.post(url, data: formData);
      setState(() {
        _result = response.statusCode == 200 ? response.data.toString() : "Error: ${response.statusMessage}";
      });
    } catch (e) {
      setState(() {
        _result = "Error: $e";
      });
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    if (kIsWeb) {
      Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageFile = null;
      });
    } else {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageBytes = null;
      });
    }

    uploadImage();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
            Expanded(
              child: Image.asset(Assets.imagesModelTst),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
              ),
            )
          

        ],
      ),
    );
  }
}

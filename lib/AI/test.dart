import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart'; // Needed for kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YOLOv8 with Dio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YoloTst(),
    );
  }
}

class YoloTst extends StatefulWidget {
  const YoloTst({super.key});

  @override
  _YoloTstState createState() => _YoloTstState();
}

class _YoloTstState extends State<YoloTst> {
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
    return Scaffold(
      appBar: AppBar(title: Text("YOLOv8 Flutter Integration with Dio")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageBytes != null
                ? Image.memory(_imageBytes!, height: 200)
                : _imageFile != null
                    ? Image.file(_imageFile!, height: 200)
                    : Text("Select an image"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Pick Image"),
            ),
            SizedBox(height: 20),
            Text("Detection Results:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

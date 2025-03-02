import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';
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
  Uint8List? _imageBytes;
  final picker = ImagePicker();
  final Dio _dio = Dio();

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
        builder: (context) => ResultScreen(imageBytes: bytes, imageFile: file),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("YOLOv8 Flutter Integration with Dio")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Pick Image"),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatefulWidget {
  final Uint8List? imageBytes;
  final File? imageFile;

  const ResultScreen({super.key, this.imageBytes, this.imageFile});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String _result = "Processing...";
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    uploadImage();
  }

  Future<void> uploadImage() async {
    String url = kIsWeb
        ? "http://127.0.0.1:5000/predict"
        : "http://10.0.2.2:5000/predict";

    FormData formData;
    if (kIsWeb && widget.imageBytes != null) {
      formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(widget.imageBytes!, filename: 'upload.png'),
      });
    } else if (widget.imageFile != null) {
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(widget.imageFile!.path, filename: 'upload.png'),
      });
    } else {
      setState(() {
        _result = "No image selected";
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detection Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.imageBytes != null
                ? Image.memory(widget.imageBytes!, height: 200)
                : widget.imageFile != null
                    ? Image.file(widget.imageFile!, height: 200)
                    : Text("No image available"),
            SizedBox(height: 10),
            Text("Detection Results:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:my_visitor/features/ML/presentation/views/ml_view.dart';
import 'package:my_visitor/temp/tst.dart';

class DetectionView extends StatefulWidget {
  final Uint8List? imageBytes;
  final File? imageFile;

  const DetectionView({super.key, this.imageBytes, this.imageFile});

  @override
  _DetectionViewState createState() => _DetectionViewState();
}

class _DetectionViewState extends State<DetectionView> {
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
        "file":
            MultipartFile.fromBytes(widget.imageBytes!, filename: 'upload.png'),
      });
    } else if (widget.imageFile != null) {
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(widget.imageFile!.path,
            filename: 'upload.png'),
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
        _result = response.statusCode == 200
            ? response.data.toString()
            : "Error: ${response.statusMessage}";
         Map<String, dynamic> detection_result = response.data ;
         String classNumber=detection_result['classes'][0].toString();
         log(detection_result.toString());
            log(classNumber.toString());
      });
    } catch (e) {
      setState(() {
        _result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.imageBytes != null
                  ? Image.memory(widget.imageBytes!, height: size.height * .4)
                  : widget.imageFile != null
                      ? Image.file(
                          widget.imageFile!,
                          height: size.height * .4,
                          width: size.width,
                          fit: BoxFit.fill,
                        )
                      : Text("No image available"),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Name", style: AppStyles.style22),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(_result),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

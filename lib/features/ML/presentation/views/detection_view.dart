import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/ML/data/historical_data.dart';
import 'package:my_visitor/features/ML/presentation/manager/cubit/image_detection_cubit.dart';
import 'package:my_visitor/generated/l10n.dart';

class DetectionView extends StatelessWidget {
  final Uint8List? imageBytes;
  final File? imageFile;
  static const String id = 'DetectionView';

  const DetectionView({super.key, this.imageBytes, this.imageFile});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (_) => ImageDetectionCubit(Dio())
        ..uploadImage(imageBytes: imageBytes, imageFile: imageFile),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            s.detection,
            style: AppStyles.style22White(context),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: BlocBuilder<ImageDetectionCubit, DetectionState>(
                builder: (context, state) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildImage(size.height * 0.3, size.width),
                      const SizedBox(height: 20),
                      _buildStateContent(context, state),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(double height, double width) {
    if (imageBytes != null) {
      return ClipRRect(
                borderRadius: BorderRadius.circular(4),

        child: Image.memory(
          imageBytes!,
        ),
      );
    } else if (imageFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.file(
          imageFile!,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Text(
        "No image available",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget _buildStateContent(BuildContext context, DetectionState state) {
    if (state is DetectionLoading || state is GetDataLoading) {
      return LoadingWidgets.loadingdotsTriangle();
    } else if (state is DetectionSuccess) {
      // DetectionModel detectionModel =
      //     BlocProvider.of<ImageDetectionCubit>(context).getItemById(classNum) ??
      //         DetectionModel(name: 'name', aboutMe: 'aboutMe', id: -1);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${historicalList[state.classNumber].name} :",
                style: AppStyles.style22White(context)),
            const SizedBox(height: 20),
            Text(historicalList[state.classNumber].aboutMe,
                style: AppStyles.style18(context)),
          ],
        ),
      );
    } else if (state is DetectionError) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'We could not identify the Image. Please try again later. ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ));
    } else {
      return const SizedBox.shrink();
    }
  }
}

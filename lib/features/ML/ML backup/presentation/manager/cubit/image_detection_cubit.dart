import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_detection_state.dart';

class ImageDetectionCubit extends Cubit<ImageDetectionState> {
  ImageDetectionCubit() : super(ImageDetectionInitial());
  
}

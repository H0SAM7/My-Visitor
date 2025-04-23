import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'resrurant_state.dart';

class ResrurantCubit extends Cubit<ResrurantState> {
  ResrurantCubit() : super(ResrurantInitial());
}

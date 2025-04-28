// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetectionModelAdapter extends TypeAdapter<DetectionModel> {
  @override
  final int typeId = 80;

  @override
  DetectionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetectionModel(
      name: fields[1] as String,
      aboutMe: fields[2] as String,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DetectionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.aboutMe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetectionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

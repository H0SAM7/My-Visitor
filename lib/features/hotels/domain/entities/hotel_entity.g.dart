// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelEntityAdapter extends TypeAdapter<HotelEntity> {
  @override
  final int typeId = 0;

  @override
  HotelEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HotelEntity()..hotels = fields[0] as HotelModel?;
  }

  @override
  void write(BinaryWriter writer, HotelEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.hotels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

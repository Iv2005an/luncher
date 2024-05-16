// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metro.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetroAdapter extends TypeAdapter<Metro> {
  @override
  final int typeId = 1;

  @override
  Metro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Metro(
      fields[0] as String,
      fields[1] as int,
      fields[2] as num,
    );
  }

  @override
  void write(BinaryWriter writer, Metro obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.distance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

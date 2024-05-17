// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vkusnoitochka_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VkusnoitochkaProductModelAdapter
    extends TypeAdapter<VkusnoitochkaProductModel> {
  @override
  final int typeId = 7;

  @override
  VkusnoitochkaProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VkusnoitochkaProductModel(
      fields[0] as String,
      fields[1] as double,
      fields[2] as String,
      fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, VkusnoitochkaProductModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.caloriesCount)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VkusnoitochkaProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkusnoitochkaProductModel _$VkusnoitochkaProductModelFromJson(
        Map<String, dynamic> json) =>
    VkusnoitochkaProductModel(
      json['id'] as String,
      (json['energyKcal'] as num).toDouble(),
      json['name'] as String,
      (json['price'] as num).toDouble(),
    );

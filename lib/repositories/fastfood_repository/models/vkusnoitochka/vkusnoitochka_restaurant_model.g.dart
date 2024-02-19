// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vkusnoitochka_restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VkusnoitochkaRestaurantModelAdapter
    extends TypeAdapter<VkusnoitochkaRestaurantModel> {
  @override
  final int typeId = 3;

  @override
  VkusnoitochkaRestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VkusnoitochkaRestaurantModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as Location,
    );
  }

  @override
  void write(BinaryWriter writer, VkusnoitochkaRestaurantModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VkusnoitochkaRestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkusnoitochkaRestaurantModel _$VkusnoitochkaRestaurantModelFromJson(
        Map<String, dynamic> json) =>
    VkusnoitochkaRestaurantModel(
      json['id'] as String,
      json['address'] as String,
      VkusnoitochkaRestaurantModel._locationFromJson(
          json['location'] as Map<String, dynamic>),
    );

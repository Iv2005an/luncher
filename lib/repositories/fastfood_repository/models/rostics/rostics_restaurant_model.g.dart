// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rostics_restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RosticsRestaurantModelAdapter
    extends TypeAdapter<RosticsRestaurantModel> {
  @override
  final int typeId = 2;

  @override
  RosticsRestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RosticsRestaurantModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as Location,
    );
  }

  @override
  void write(BinaryWriter writer, RosticsRestaurantModel obj) {
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
      other is RosticsRestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RosticsRestaurantModel _$RosticsRestaurantModelFromJson(
        Map<String, dynamic> json) =>
    RosticsRestaurantModel(
      json['storeId'] as String,
      RosticsRestaurantModel._readAddressFromJson(json, 'address') as String,
      RosticsRestaurantModel._locationFromJson(
          RosticsRestaurantModel._readLocationFromJson(json, 'location')
              as Map<String, dynamic>),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burgerking_restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BurgerkingRestaurantModelAdapter
    extends TypeAdapter<BurgerkingRestaurantModel> {
  @override
  final int typeId = 2;

  @override
  BurgerkingRestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BurgerkingRestaurantModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as Location,
    );
  }

  @override
  void write(BinaryWriter writer, BurgerkingRestaurantModel obj) {
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
      other is BurgerkingRestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BurgerkingRestaurantModel _$BurgerkingRestaurantModelFromJson(
        Map<String, dynamic> json) =>
    BurgerkingRestaurantModel(
      BurgerkingRestaurantModel._idFromJson((json['id'] as num).toInt()),
      json['address'] as String,
      BurgerkingRestaurantModel._locationFromJson(
          BurgerkingRestaurantModel._readLocationFromJson(json, 'location')
              as Map<String, dynamic>),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vkusnoitochka_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VkusnoitochkaCategoryModelAdapter
    extends TypeAdapter<VkusnoitochkaCategoryModel> {
  @override
  final int typeId = 6;

  @override
  VkusnoitochkaCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VkusnoitochkaCategoryModel(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, VkusnoitochkaCategoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.productsIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VkusnoitochkaCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkusnoitochkaCategoryModel _$VkusnoitochkaCategoryModelFromJson(
        Map<String, dynamic> json) =>
    VkusnoitochkaCategoryModel(
      json['name'] as String,
      (json['productsIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

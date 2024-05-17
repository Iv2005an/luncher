import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../abstract_product_model.dart';

part 'vkusnoitochka_product_model.g.dart';

@JsonSerializable(createToJson: false)
@HiveType(typeId: 7)
class VkusnoitochkaProductModel extends AbstractProductModel {
  const VkusnoitochkaProductModel(
      this.id, this.caloriesCount, this.name, this.price);

  factory VkusnoitochkaProductModel.fromJson(Map<String, dynamic> json) =>
      _$VkusnoitochkaProductModelFromJson(json);

  @HiveField(0)
  @override
  final String id;

  @JsonKey(name: 'energyKcal')
  @HiveField(1)
  @override
  final double caloriesCount;

  @HiveField(2)
  @override
  final String name;

  @HiveField(3)
  @override
  final double price;
}

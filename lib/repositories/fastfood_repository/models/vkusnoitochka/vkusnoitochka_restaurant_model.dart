import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'vkusnoitochka_restaurant_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(createToJson: false)
class VkusnoitochkaRestaurantModel extends AbstractRestaurantModel {
  const VkusnoitochkaRestaurantModel(this.id, this.address, this.location);

  factory VkusnoitochkaRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$VkusnoitochkaRestaurantModelFromJson(json);

  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final String address;

  @HiveField(2)
  @JsonKey(fromJson: _locationFromJson)
  @override
  final Location location;

  static Location _locationFromJson(Map<String, dynamic> location) =>
      Location(location['lon'], location['lat']);
}

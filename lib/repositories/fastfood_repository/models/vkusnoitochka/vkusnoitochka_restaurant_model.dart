import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'vkusnoitochka_restaurant_model.g.dart';

@JsonSerializable(createToJson: false)
class VkusnoitochkaRestaurantModel extends AbstractRestaurantModel {
  const VkusnoitochkaRestaurantModel(this.id, this.address, this.location);

  factory VkusnoitochkaRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$VkusnoitochkaRestaurantModelFromJson(json);

  @override
  final String id;

  @override
  final String address;

  @JsonKey(fromJson: _locationFromJson)
  @override
  final Location location;

  static Location _locationFromJson(Map<String, dynamic> location) =>
      Location(location['lon'], location['lat']);
}

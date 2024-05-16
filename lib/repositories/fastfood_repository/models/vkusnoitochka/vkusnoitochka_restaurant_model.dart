import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'vkusnoitochka_restaurant_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(createToJson: false)
class VkusnoitochkaRestaurantModel extends AbstractRestaurantModel {
  const VkusnoitochkaRestaurantModel(
      this.id, this.address, this.location, this.metroList);

  factory VkusnoitochkaRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$VkusnoitochkaRestaurantModelFromJson(json);

  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final String address;

  @JsonKey(fromJson: _locationFromJson)
  @HiveField(2)
  @override
  final Location location;
  static Location _locationFromJson(Map<String, dynamic> rawLocation) =>
      Location(rawLocation['lon'], rawLocation['lat']);

  @JsonKey(fromJson: _metroListFromJson)
  @HiveField(3)
  @override
  final List<Metro> metroList;
  static List<Metro> _metroListFromJson(List rawMetroList) => [
        for (var rawMetro in rawMetroList)
          Metro(
              rawMetro['name'],
              int.parse('FF${(rawMetro['color'] as String).substring(1)}',
                  radix: 16),
              rawMetro['distance'])
      ];
}

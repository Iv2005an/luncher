import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'rostics_restaurant_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(createToJson: false)
class RosticsRestaurantModel extends AbstractRestaurantModel {
  const RosticsRestaurantModel(this.id, this.address, this.location);

  factory RosticsRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RosticsRestaurantModelFromJson(json);

  @HiveField(0)
  @JsonKey(name: 'storeId')
  @override
  final String id;

  @HiveField(1)
  @JsonKey(readValue: _readAddressFromJson)
  @override
  final String address;

  static Object? _readAddressFromJson(Map<dynamic, dynamic> json, String key) =>
      json['contacts']['streetAddress']['ru'];

  @HiveField(2)
  @JsonKey(readValue: _readLocationFromJson, fromJson: _locationFromJson)
  @override
  final Location location;

  static Object? _readLocationFromJson(
          Map<dynamic, dynamic> json, String key) =>
      json['contacts']['coordinates'];

  static Location _locationFromJson(Map<String, dynamic> coordinates) {
    final location = coordinates['geometry']['coordinates'] as List;
    return Location(location[1], location[0]);
  }
}

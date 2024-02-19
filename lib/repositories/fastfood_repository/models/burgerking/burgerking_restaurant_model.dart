import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'burgerking_restaurant_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class BurgerkingRestaurantModel extends AbstractRestaurantModel {
  const BurgerkingRestaurantModel(this.id, this.address, this.location);

  factory BurgerkingRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$BurgerkingRestaurantModelFromJson(json);

  @HiveField(0)
  @override
  @JsonKey(fromJson: _idFromJson)
  final String id;

  static String _idFromJson(int id) => id.toString();

  @HiveField(1)
  @override
  final String address;

  @HiveField(2)
  @JsonKey(readValue: _readLocationFromJson, fromJson: _locationFromJson)
  @override
  final Location location;

  static Object? _readLocationFromJson(
          Map<dynamic, dynamic> json, String key) =>
      {'longitude': json['longitude'], 'latitude': json['latitude']};

  static Location _locationFromJson(Map<String, dynamic> location) =>
      Location(location['longitude'], location['latitude']);
}

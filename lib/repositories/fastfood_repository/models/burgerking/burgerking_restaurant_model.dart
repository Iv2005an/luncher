import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'burgerking_restaurant_model.g.dart';

@JsonSerializable(createToJson: false)
class BurgerkingRestaurantModel extends AbstractRestaurantModel {
  const BurgerkingRestaurantModel(this.id, this.address, this.location);

  factory BurgerkingRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$BurgerkingRestaurantModelFromJson(json);

  @override
  @JsonKey(fromJson: _idFromJson)
  final String id;

  static String _idFromJson(int id) => id.toString();

  @override
  final String address;

  @JsonKey(readValue: _readLocationFromJson, fromJson: _locationFromJson)
  @override
  final Location location;

  static Object? _readLocationFromJson(
          Map<dynamic, dynamic> json, String key) =>
      {'longitude': json['longitude'], 'latitude': json['latitude']};

  static Location _locationFromJson(Map<String, dynamic> location) =>
      Location(location['longitude'], location['latitude']);
}

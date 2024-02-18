// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rostics_restaurant_model.dart';

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

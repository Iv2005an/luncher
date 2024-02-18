// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burgerking_restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BurgerkingRestaurantModel _$BurgerkingRestaurantModelFromJson(
        Map<String, dynamic> json) =>
    BurgerkingRestaurantModel(
      BurgerkingRestaurantModel._idFromJson(json['id'] as int),
      json['address'] as String,
      BurgerkingRestaurantModel._locationFromJson(
          BurgerkingRestaurantModel._readLocationFromJson(json, 'location')
              as Map<String, dynamic>),
    );

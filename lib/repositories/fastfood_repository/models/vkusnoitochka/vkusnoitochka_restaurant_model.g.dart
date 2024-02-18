// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vkusnoitochka_restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkusnoitochkaRestaurantModel _$VkusnoitochkaRestaurantModelFromJson(
        Map<String, dynamic> json) =>
    VkusnoitochkaRestaurantModel(
      json['id'] as String,
      json['address'] as String,
      VkusnoitochkaRestaurantModel._locationFromJson(
          json['location'] as Map<String, dynamic>),
    );

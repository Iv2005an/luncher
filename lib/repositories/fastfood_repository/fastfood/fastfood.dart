import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_abstract_fastfood_config.dart';
import '../models/models.dart';

part 'burgerking_repository.dart';
part 'rostics_repository.dart';
part 'vkusnoitochka_repository.dart';

abstract class AbstractFastfoodRepository {
  Future<List<AbstractRestaurantModel>> get allRestaurants;
  Future<List<AbstractRestaurantModel>> get restaurants;
  Future<void> addRestaurant(AbstractRestaurantModel restaurant);
  Future<void> deleteRestaurant(AbstractRestaurantModel restaurant);
  Future<String?> getSelectedRestaurant();
  Future<void> setSelectedRestaurant(String restaurantId);

  Future<int> _getRestaurantsUpdateTime(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getAllRestaurantsUpdateTimeBox())
          .get(fastfoodName) ??
      0;
  Future<void> _setRestaurantsUpdateTime(
          String fastfoodName, int updateTime) async =>
      (await AbstractHiveFastfoodConfig.getAllRestaurantsUpdateTimeBox())
          .put(fastfoodName, updateTime);

  Future<String?> _getSelectedRestaurant(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getSelectedRestaurantBox())
          .get(fastfoodName);
  Future<void> _setSelectedRestaurant(
          String fastfoodName, String restaurantId) async =>
      (await AbstractHiveFastfoodConfig.getSelectedRestaurantBox())
          .put(fastfoodName, restaurantId);

  Map<String, T> _convertRawRestaurants<T>(List rawRestaurants,
      T Function(Map<String, dynamic> rawRestaurant) getRestaurant) {
    Map<String, T> restaurants = {};
    for (Map<String, dynamic> rawRestaurant in rawRestaurants) {
      final restaurant =
          getRestaurant(rawRestaurant) as AbstractRestaurantModel;
      restaurants[restaurant.id] = restaurant as T;
    }
    return restaurants;
  }
}

import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

abstract class AbstractFastfoodRepository {
  Future<List<AbstractRestaurantModel>> getRestaurants();

  Future<List<T>> getRestaurantsFromApi<T>(
    List rawRestaurants,
    T Function(Map<String, dynamic> rawRestaurant) getRestaurant,
  ) async {
    List<T> restaurants = [];
    rawRestaurants
        .map((rawRestaurant) => restaurants
            .add(getRestaurant(rawRestaurant as Map<String, dynamic>)))
        .toList();
    return restaurants;
  }

  List<T> getRestaurantsFromLocal<T>(Box<T> restaurantsBox) =>
      restaurantsBox.values.toList();

  void saveRestaurantsToLocal<T>(
    Box<T> restaurantsBox,
    List<T> restaurants,
  ) {
    final restaurantMap = {
      for (T restaurant in restaurants)
        (restaurant as AbstractRestaurantModel).id: restaurant
    };
    restaurantsBox.putAll(restaurantMap);
  }
}

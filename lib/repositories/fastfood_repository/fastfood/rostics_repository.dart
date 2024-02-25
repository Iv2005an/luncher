import 'package:kfc_russia_api/kfc_russia_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_rostics_config.dart';
import '../fastfood_repository.dart';

class RosticsRepository implements AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getRestaurants() async {
    final restaurantBox = await HiveRosticsConfig.getRestaurantsBox();
    if (restaurantBox.isEmpty) {
      final restaurantMap = {
        for (RosticsRestaurantModel restaurant
            in await _getRestaurantsFromApi())
          restaurant.id: restaurant
      };
      restaurantBox.putAll(restaurantMap);
    }
    return restaurantBox.values.toList();
  }

  Future<List<RosticsRestaurantModel>> _getRestaurantsFromApi() async {
    final apiResponse = await KFC.getRestaurants();
    final rawData = apiResponse.data as Map<String, dynamic>;
    final rawRestaurants = rawData['searchResults'] as List;
    List<RosticsRestaurantModel> restaurants = [];
    rawRestaurants
        .map((rawRestaurant) => restaurants
            .add(RosticsRestaurantModel.fromJson(rawRestaurant['storePublic'])))
        .toList();
    return restaurants;
  }
}

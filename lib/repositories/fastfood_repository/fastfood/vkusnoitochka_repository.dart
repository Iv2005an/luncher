import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_vkusnoitochka_config.dart';
import '../fastfood_repository.dart';

class VkusnoitochkaRepository implements AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getRestaurants() async {
    final restaurantBox = await HiveVkusnoitochkaConfig.getRestaurantsBox();
    if (restaurantBox.isEmpty) {
      final restaurantMap = {
        for (VkusnoitochkaRestaurantModel restaurant
            in await _getRestaurantsFromApi())
          restaurant.id: restaurant
      };
      restaurantBox.putAll(restaurantMap);
    }
    return restaurantBox.values.toList();
  }

  Future<List<VkusnoitochkaRestaurantModel>> _getRestaurantsFromApi() async {
    final apiResponse = await VIT.getRestaurants();
    final rawData = apiResponse.data as Map<String, dynamic>;
    final rawRestaurants = rawData['items'] as List;
    List<VkusnoitochkaRestaurantModel> restaurants = [];
    rawRestaurants
        .map((rawRestaurant) => restaurants
            .add(VkusnoitochkaRestaurantModel.fromJson(rawRestaurant)))
        .toList();
    return restaurants;
  }
}

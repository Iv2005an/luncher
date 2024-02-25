import 'package:burger_king_russia_api/burger_king_russia_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_burgerking_config.dart';
import '../fastfood_repository.dart';

class BurgerkingRepository implements AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getRestaurants() async {
    final restaurantBox = await HiveBurgerkingConfig.getRestaurantsBox();
    if (restaurantBox.isEmpty) {
      final restaurantMap = {
        for (BurgerkingRestaurantModel restaurant
            in await _getRestaurantsFromApi())
          restaurant.id: restaurant
      };
      restaurantBox.putAll(restaurantMap);
    }
    return restaurantBox.values.toList();
  }

  Future<List<BurgerkingRestaurantModel>> _getRestaurantsFromApi() async {
    final apiResponse = await BK.getRestaurants();
    final rawData = apiResponse.data as Map<String, dynamic>;
    final rawRestaurants = rawData['response']['list'] as List;
    List<BurgerkingRestaurantModel> restaurants = [];
    rawRestaurants
        .map((rawRestaurant) =>
            restaurants.add(BurgerkingRestaurantModel.fromJson(rawRestaurant)))
        .toList();
    return restaurants;
  }
}

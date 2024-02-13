import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import 'abstract_franchise_repository.dart';
import 'models/restaurant_model.dart';

class VkusnoitochkaRepository implements AbstractFranchiseRepository {
  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    final rawData = (await VIT.getRestaurants()).data as Map<String, dynamic>;
    final rawRestaurants = rawData['items'] as List;
    List<RestaurantModel> restaurants = [];
    for (Map<String, dynamic> rawRestaurant in rawRestaurants) {
      restaurants.add(RestaurantModel(
          rawRestaurant['id'],
          rawRestaurant['address'],
          rawRestaurant['location']['lon'],
          rawRestaurant['location']['lat']));
    }
    return restaurants;
  }
}

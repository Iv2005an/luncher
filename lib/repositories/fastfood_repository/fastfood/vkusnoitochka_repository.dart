import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import '../fastfood_repository.dart';

class VkusnoitochkaRepository extends AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getActualRestaurants() {
    return getRestaurantsFromApi();
  }

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromApi() async {
    final rawData = (await VIT.getRestaurants()).data as Map<String, dynamic>;
    final rawRestaurants = rawData['items'] as List;
    List<VkusnoitochkaRestaurantModel> restaurants = [];
    for (Map<String, dynamic> rawRestaurant in rawRestaurants) {
      restaurants.add(VkusnoitochkaRestaurantModel.fromJson(rawRestaurant));
    }
    return restaurants;
  }

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromLocal() {
    // TODO: implement getRestaurantsFromLocal
    throw UnimplementedError();
  }
}

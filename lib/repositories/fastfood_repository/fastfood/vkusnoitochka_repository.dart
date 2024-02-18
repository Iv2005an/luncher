import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import '../fastfood_repository.dart';

class VkusnoitochkaRepository extends AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getActualRestaurants() {
    // TODO: implement getActualRestaurants
    return getRestaurantsFromApi();
  }

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromApi() async {
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

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromLocal() {
    // TODO: implement getRestaurantsFromLocal
    throw UnimplementedError();
  }
}

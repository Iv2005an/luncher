import 'package:kfc_russia_api/kfc_russia_api.dart';

import '../fastfood_repository.dart';

class RosticsRepository extends AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getActualRestaurants() {
    // TODO: implement getActualRestaurants
    return getRestaurantsFromApi();
  }

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromApi() async {
    final apiResponse = await KFC.getRestaurants();
    final rawData = apiResponse.data as Map<String, dynamic>;
    final rawRestaurants = rawData['searchResults'] as List;
    List<RosticsRestaurantModel> restaurants = [];
    rawRestaurants
        .map(
          (rawRestaurant) => restaurants.add(
            RosticsRestaurantModel.fromJson(rawRestaurant['storePublic']),
          ),
        )
        .toList();
    return restaurants;
  }

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromLocal() {
    // TODO: implement getRestaurantsFromLocal
    throw UnimplementedError();
  }
}

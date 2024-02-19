import 'package:burger_king_russia_api/burger_king_russia_api.dart';

import '../fastfood_repository.dart';

class BurgerkingRepository extends AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getActualRestaurants() {
    // TODO: implement getActualRestaurants
    return getRestaurantsFromApi();
  }

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromApi() async {
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

  @override
  Future<List<AbstractRestaurantModel>> getRestaurantsFromLocal() {
    // TODO: implement getRestaurantsFromLocal
    throw UnimplementedError();
  }
}

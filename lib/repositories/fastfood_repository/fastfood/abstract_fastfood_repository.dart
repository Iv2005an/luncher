import '../fastfood_repository.dart';

abstract class AbstractFastfoodRepository {
  const AbstractFastfoodRepository();
  Future<List<AbstractRestaurantModel>> getActualRestaurants();
  Future<List<AbstractRestaurantModel>> getRestaurantsFromApi();
  Future<List<AbstractRestaurantModel>> getRestaurantsFromLocal();

  Future<List<AbstractRestaurantModel>> getRestaurants() async {
    return getActualRestaurants();
  }
}

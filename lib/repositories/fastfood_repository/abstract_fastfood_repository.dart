import 'fastfood_repository.dart';

abstract class AbstractFastfoodRepository {
  Future<List<RestaurantModel>> getRestaurants();
}

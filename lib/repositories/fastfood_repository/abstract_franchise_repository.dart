import 'fastfood_repository.dart';

abstract class AbstractFranchiseRepository {
  Future<List<RestaurantModel>> getRestaurants();
}

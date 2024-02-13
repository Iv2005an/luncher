import 'models/restaurant_model.dart';

abstract class AbstractFranchiseRepository {
  Future<List<RestaurantModel>> getRestaurants();
}

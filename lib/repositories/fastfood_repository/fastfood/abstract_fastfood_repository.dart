import '../fastfood_repository.dart';

abstract interface class AbstractFastfoodRepository {
  const AbstractFastfoodRepository();
  Future<List<AbstractRestaurantModel>> getRestaurants();
}

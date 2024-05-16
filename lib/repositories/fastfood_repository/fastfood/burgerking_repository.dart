part of 'fastfood.dart';

class BurgerkingRepository extends AbstractFastfoodRepository {
  @override
  // TODO: implement restaurants
  Future<List<AbstractRestaurantModel>> get allRestaurants =>
      throw UnimplementedError();

  @override
  Future<List<AbstractRestaurantModel>> get restaurants async =>
      (await HiveBurgerkingConfig().getRestaurantsBox()).values.toList();

  @override
  Future addRestaurant(AbstractRestaurantModel restaurant) async {
    (await HiveBurgerkingConfig().getRestaurantsBox())
        .put(restaurant.id, restaurant as BurgerkingRestaurantModel);
  }

  @override
  Future<void> deleteRestaurant(AbstractRestaurantModel restaurant) async {
    (await HiveBurgerkingConfig().getRestaurantsBox()).delete(restaurant.id);
  }

  @override
  Future<String?> getSelectedRestaurant() {
    // TODO: implement getSelectedRestaurant
    throw UnimplementedError();
  }

  @override
  Future<void> setSelectedRestaurant(String restaurantId) {
    // TODO: implement setSelectedRestaurant
    throw UnimplementedError();
  }
}

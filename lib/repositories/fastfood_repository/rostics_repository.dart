part of 'fastfood_repository.dart';

class RosticsRepository extends AbstractFastfoodRepository {
  @override
  // TODO: implement restaurants
  Future<List<AbstractRestaurantModel>> get allRestaurants =>
      throw UnimplementedError();

  @override
  Future<List<AbstractRestaurantModel>> get restaurants async =>
      (await HiveRosticsConfig().getRestaurantsBox()).values.toList();

  @override
  Future addRestaurant(AbstractRestaurantModel restaurant) async {
    (await HiveRosticsConfig().getRestaurantsBox())
        .put(restaurant.id, restaurant as RosticsRestaurantModel);
  }

  @override
  Future<void> deleteRestaurant(AbstractRestaurantModel restaurant) async {
    (await HiveRosticsConfig().getRestaurantsBox()).delete(restaurant.id);
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

  @override
  Future<City> getCity(String cityId) {
    // TODO: implement getCity
    throw UnimplementedError();
  }

  @override
  Future<List<AbstractCategoryModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Map<String, List<AbstractProductModel>>> getCategoriesProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}

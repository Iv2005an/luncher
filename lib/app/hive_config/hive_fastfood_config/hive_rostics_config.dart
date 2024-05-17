part of 'hive_abstract_fastfood_config.dart';

class HiveRosticsConfig implements AbstractHiveFastfoodConfig {
  static const fastfoodName = 'rostics';

  static void init() {
    Hive.registerAdapter(RosticsRestaurantModelAdapter());
  }

  @override
  Future<Box<City>> getCitiesBox() {
    // TODO: implement getCitiesBox
    throw UnimplementedError();
  }

  @override
  Future<Box<RosticsRestaurantModel>> getAllRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getAllRestaurantsBox(fastfoodName);
  @override
  Future<Box<RosticsRestaurantModel>> getRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getRestaurantsBox(fastfoodName);

  @override
  Future<Box<AbstractCategoryModel>> getCategoriesBox(String cityId) {
    // TODO: implement getCategoriesBox
    throw UnimplementedError();
  }

  @override
  Future<Box<AbstractProductModel>> getProductsBox(String cityId) {
    // TODO: implement getProductsBox
    throw UnimplementedError();
  }
}

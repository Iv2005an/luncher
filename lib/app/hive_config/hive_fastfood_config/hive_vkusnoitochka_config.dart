part of 'hive_abstract_fastfood_config.dart';

class HiveVkusnoitochkaConfig extends AbstractHiveFastfoodConfig {
  static const fastfoodName = 'vkusnoitochka';

  static void init() {
    Hive.registerAdapter(VkusnoitochkaRestaurantModelAdapter());
    Hive.registerAdapter(VkusnoitochkaCategoryModelAdapter());
    Hive.registerAdapter(VkusnoitochkaProductModelAdapter());
  }

  @override
  Future<Box<City>> getCitiesBox() async =>
      AbstractHiveFastfoodConfig._getCitiesBox(fastfoodName);
  @override
  Future<Box<VkusnoitochkaRestaurantModel>> getAllRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getAllRestaurantsBox(fastfoodName);
  @override
  Future<Box<VkusnoitochkaRestaurantModel>> getRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getRestaurantsBox(fastfoodName);
  @override
  Future<Box<AbstractProductModel>> getProductsBox(String cityId) async =>
      await AbstractHiveFastfoodConfig._getProductsBox(fastfoodName, cityId);
  @override
  Future<Box<AbstractCategoryModel>> getCategoriesBox(String cityId) async =>
      await AbstractHiveFastfoodConfig._getCategoriesBox(fastfoodName, cityId);
}

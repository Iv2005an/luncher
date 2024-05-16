part of 'hive_abstract_fastfood_config.dart';

class HiveVkusnoitochkaConfig extends AbstractHiveFastfoodConfig {
  static const fastfoodName = 'vkusnoitochka';

  static void init() {
    Hive.registerAdapter(VkusnoitochkaRestaurantModelAdapter());
  }

  @override
  Future<Box<VkusnoitochkaRestaurantModel>> getAllRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getAllRestaurantsBox(fastfoodName);
  @override
  Future<Box<VkusnoitochkaRestaurantModel>> getRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getRestaurantsBox(fastfoodName);
}

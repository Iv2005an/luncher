part of 'hive_abstract_fastfood_config.dart';

class HiveRosticsConfig implements AbstractHiveFastfoodConfig {
  static const fastfoodName = 'rostics';

  static void init() {
    Hive.registerAdapter(RosticsRestaurantModelAdapter());
  }

  @override
  Future<Box<RosticsRestaurantModel>> getAllRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getAllRestaurantsBox(fastfoodName);
  @override
  Future<Box<RosticsRestaurantModel>> getRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getRestaurantsBox(fastfoodName);
}

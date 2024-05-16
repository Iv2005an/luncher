part of 'hive_abstract_fastfood_config.dart';

class HiveBurgerkingConfig implements AbstractHiveFastfoodConfig {
  static const fastfoodName = 'burgerking';

  static void init() {
    Hive.registerAdapter(BurgerkingRestaurantModelAdapter());
  }

  @override
  Future<Box<BurgerkingRestaurantModel>> getAllRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getAllRestaurantsBox(fastfoodName);
  @override
  Future<Box<BurgerkingRestaurantModel>> getRestaurantsBox() async =>
      await AbstractHiveFastfoodConfig._getRestaurantsBox(fastfoodName);
}

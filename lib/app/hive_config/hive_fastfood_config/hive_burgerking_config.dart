import 'package:hive_flutter/hive_flutter.dart';

import 'package:luncher/repositories/fastfood_repository/models/burgerking/burgerking_restaurant_model.dart';
import 'hive_fastfood_config.dart';

class HiveBurgerkingConfig {
  static const fastfoodName = 'burgerking';

  static void init() {
    Hive.registerAdapter(BurgerkingRestaurantModelAdapter());
  }

  static Future<Box<BurgerkingRestaurantModel>> getRestaurantsBox() async =>
      await HiveFastfoodConfig.getRestaurantBox<BurgerkingRestaurantModel>(
          fastfoodName);
}

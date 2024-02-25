import 'package:hive_flutter/hive_flutter.dart';

import 'package:luncher/repositories/fastfood_repository/models/rostics/rostics_restaurant_model.dart';
import 'hive_fastfood_config.dart';

class HiveRosticsConfig {
  static const fastfoodName = 'rostics';

  static void init() {
    Hive.registerAdapter(RosticsRestaurantModelAdapter());
  }

  static Future<Box<RosticsRestaurantModel>> getRestaurantsBox() async =>
      await HiveFastfoodConfig.getRestaurantBox<RosticsRestaurantModel>(
          fastfoodName);
}

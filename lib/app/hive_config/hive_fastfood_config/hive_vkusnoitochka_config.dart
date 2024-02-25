import 'package:hive_flutter/hive_flutter.dart';

import 'package:luncher/repositories/fastfood_repository/models/vkusnoitochka/vkusnoitochka_restaurant_model.dart';
import 'hive_fastfood_config.dart';

class HiveVkusnoitochkaConfig {
  static const fastfoodName = 'vkusnoitochka';

  static void init() {
    Hive.registerAdapter(VkusnoitochkaRestaurantModelAdapter());
  }

  static Future<Box<VkusnoitochkaRestaurantModel>> getRestaurantsBox() async =>
      await HiveFastfoodConfig.getRestaurantBox<VkusnoitochkaRestaurantModel>(
          fastfoodName);
}

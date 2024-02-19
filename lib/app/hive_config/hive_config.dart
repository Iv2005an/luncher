export 'hive_fastfood_config/hive_burgerking_config.dart';
export 'hive_fastfood_config/hive_rostics_config.dart';
export 'hive_fastfood_config/hive_vkusnoitochka_config.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '';
import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    _openBoxes();
  }

  static void _openBoxes() {
    Hive.openBox<BurgerkingRestaurantModel>(
      HiveBurgerkingConfig.restaurantBoxName,
    );
    Hive.openBox<RosticsRestaurantModel>(
      HiveRosticsConfig.restaurantBoxName,
    );
    Hive.openBox<VkusnoitochkaRestaurantModel>(
      HiveVkusnoitochkaConfig.restaurantBoxName,
    );
  }

  static void _registerAdapters() {
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(BurgerkingRestaurantModelAdapter());
    Hive.registerAdapter(RosticsRestaurantModelAdapter());
    Hive.registerAdapter(VkusnoitochkaRestaurantModelAdapter());
  }
}

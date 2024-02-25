import 'package:hive_flutter/hive_flutter.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';
import 'hive_burgerking_config.dart';
import 'hive_rostics_config.dart';
import 'hive_vkusnoitochka_config.dart';

class HiveFastfoodConfig {
  static void init() {
    Hive.registerAdapter(LocationAdapter());
    HiveBurgerkingConfig.init();
    HiveRosticsConfig.init();
    HiveVkusnoitochkaConfig.init();
  }

  static String getBoxName(String fastfoodName, String modelsName) =>
      '${fastfoodName}_${modelsName}_box';

  static Future<Box<T>> getBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return Hive.openBox<T>(boxName);
  }

  static Future<Box<T>> getRestaurantBox<T>(String fastfoodName) async =>
      getBox<T>(getBoxName(fastfoodName, 'restaurants'));
}

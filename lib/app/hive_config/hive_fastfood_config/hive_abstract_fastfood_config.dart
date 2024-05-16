import 'package:hive_flutter/hive_flutter.dart';

import 'package:luncher/repositories/fastfood_repository/models/models.dart';

part 'hive_burgerking_config.dart';
part 'hive_rostics_config.dart';
part 'hive_vkusnoitochka_config.dart';

abstract class AbstractHiveFastfoodConfig {
  static void init() {
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(MetroAdapter());
    HiveBurgerkingConfig.init();
    HiveRosticsConfig.init();
    HiveVkusnoitochkaConfig.init();
  }

  Future<Box<AbstractRestaurantModel>> getAllRestaurantsBox();
  Future<Box<AbstractRestaurantModel>> getRestaurantsBox();
  // Future<Box<AbstractProductModel>> getProductsBox();

  static String _getBoxName(String fastfoodName, String modelsName) =>
      '${fastfoodName}_${modelsName}_box';
  static String _getUpdateTimeBoxName(String modelsName) =>
      '${modelsName}_update_time_box';

  static Future<Box<T>> _getBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) return Hive.box<T>(boxName);
    return Hive.openBox<T>(boxName);
  }

  static Future<Box<T>> _getAllRestaurantsBox<T>(String fastfoodName) async =>
      _getBox<T>(_getBoxName(fastfoodName, 'all_restaurants'));
  static Future<Box<int>> getAllRestaurantsUpdateTimeBox<T>() async =>
      _getBox<int>(_getUpdateTimeBoxName('all_restaurants'));
  static Future<Box<T>> _getRestaurantsBox<T>(String fastfoodName) async =>
      _getBox<T>(_getBoxName(fastfoodName, 'restaurants'));
  static Future<Box<String>> getSelectedRestaurantBox<T>() async =>
      _getBox<String>('selected_restaurant_box');
}

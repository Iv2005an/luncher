import 'package:hive_flutter/hive_flutter.dart';

import 'package:luncher/repositories/fastfood_repository/models/models.dart';
import 'package:luncher/repositories/fastfood_repository/models/vkusnoitochka/vkusnoitochka_product_model.dart';

part 'hive_burgerking_config.dart';
part 'hive_rostics_config.dart';
part 'hive_vkusnoitochka_config.dart';

abstract class AbstractHiveFastfoodConfig {
  static void init() {
    Hive.registerAdapter(CityAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(MetroAdapter());
    HiveBurgerkingConfig.init();
    HiveRosticsConfig.init();
    HiveVkusnoitochkaConfig.init();
  }

  Future<Box<City>> getCitiesBox();
  Future<Box<AbstractRestaurantModel>> getAllRestaurantsBox();
  Future<Box<AbstractRestaurantModel>> getRestaurantsBox();
  Future<Box<AbstractCategoryModel>> getCategoriesBox(String cityId);
  Future<Box<AbstractProductModel>> getProductsBox(String cityId);

  static String _getBoxName(String fastfoodName, String modelsName) =>
      '${fastfoodName}_${modelsName}_box';
  static String _getUpdateTimeBoxName(String fastfoodName) =>
      '${fastfoodName}_update_time_box';

  static Future<Box<T>> _getBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) return Hive.box<T>(boxName);
    return Hive.openBox<T>(boxName);
  }

  static Future<Box<int>> getUpdateTimeBox(fastfoodName) async =>
      _getBox(_getUpdateTimeBoxName(fastfoodName));
  static Future<Box<City>> _getCitiesBox(String fastfoodName) =>
      _getBox(_getBoxName(fastfoodName, 'cities'));
  static Future<Box<T>> _getAllRestaurantsBox<T>(String fastfoodName) async =>
      _getBox(_getBoxName(fastfoodName, 'all_restaurants'));
  static Future<Box<T>> _getRestaurantsBox<T>(String fastfoodName) async =>
      _getBox(_getBoxName(fastfoodName, 'restaurants'));
  static Future<Box<String>> getSelectedRestaurantBox<T>() async =>
      _getBox('selected_restaurant_box');
  static Future<Box<AbstractCategoryModel>> _getCategoriesBox(
          String fastfoodName, String cityId) =>
      _getBox(_getBoxName(fastfoodName, 'categories_$cityId'));
  static Future<Box<AbstractProductModel>> _getProductsBox(
          String fastfoodName, String cityId) =>
      _getBox(_getBoxName(fastfoodName, 'products_$cityId'));
}

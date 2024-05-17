import 'package:luncher/repositories/fastfood_repository/models/vkusnoitochka/vkusnoitochka_product_model.dart';
import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import '';
import 'package:luncher/app/hive_config/hive_fastfood_config/hive_abstract_fastfood_config.dart';

export 'models/models.dart';

part 'burgerking_repository.dart';
part 'rostics_repository.dart';
part 'vkusnoitochka_repository.dart';

abstract class AbstractFastfoodRepository {
  Future<City?> getCity(String cityId);
  Future<List<AbstractRestaurantModel>> get allRestaurants;
  Future<List<AbstractRestaurantModel>> get restaurants;
  Future<void> addRestaurant(AbstractRestaurantModel restaurant);
  Future<void> deleteRestaurant(AbstractRestaurantModel restaurant);
  Future<String?> getSelectedRestaurant();
  Future<void> setSelectedRestaurant(String restaurantId);
  Future<List<AbstractCategoryModel>> getCategories();
  Future<Map<String, List<AbstractProductModel>>> getCategoriesProducts();

  Future<int> _getCitiesUpdateTime(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .get('cities') ??
      0;
  Future<void> _setCitiesUpdateTime(
          String fastfoodName, int updateTime) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .put('cities', updateTime);

  Future<int> _getRestaurantsUpdateTime(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .get('restaurants') ??
      0;
  Future<void> _setRestaurantsUpdateTime(
          String fastfoodName, int updateTime) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .put('restaurants', updateTime);

  Future<int> _getCategoriesUpdateTime(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .get('categories') ??
      0;
  Future<void> _setCategoriesUpdateTime(
          String fastfoodName, int updateTime) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .put('categories', updateTime);

  Future<int> _getProductsUpdateTime(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .get('products') ??
      0;
  Future<void> _setProductsUpdateTime(
          String fastfoodName, int updateTime) async =>
      (await AbstractHiveFastfoodConfig.getUpdateTimeBox(fastfoodName))
          .put('products', updateTime);

  Future<String?> _getSelectedRestaurant(String fastfoodName) async =>
      (await AbstractHiveFastfoodConfig.getSelectedRestaurantBox())
          .get(fastfoodName);
  Future<void> _setSelectedRestaurant(
          String fastfoodName, String restaurantId) async =>
      (await AbstractHiveFastfoodConfig.getSelectedRestaurantBox())
          .put(fastfoodName, restaurantId);
}

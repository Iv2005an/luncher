part of 'fastfood.dart';

class VkusnoitochkaRepository extends AbstractFastfoodRepository {
  final fastfoodName = HiveVkusnoitochkaConfig.fastfoodName;
  @override
  Future<List<AbstractRestaurantModel>> get allRestaurants async {
    final updateTime = await _getRestaurantsUpdateTime(fastfoodName);
    final rawResponseData = (await VIT.getRestaurants(updateTime)).data;
    final allRestaurantBox =
        await HiveVkusnoitochkaConfig().getAllRestaurantsBox();
    final rawRestaurants = rawResponseData['items'] as List;
    if (rawRestaurants.isNotEmpty) {
      allRestaurantBox.putAll(_convertRawRestaurants(
          rawRestaurants,
          (rawRestaurant) =>
              VkusnoitochkaRestaurantModel.fromJson(rawRestaurant)));
      await _setRestaurantsUpdateTime(
          fastfoodName, rawResponseData['lastUpdated'] + 1);
    }
    return allRestaurantBox.values.toList();
  }

  @override
  Future<List<AbstractRestaurantModel>> get restaurants async =>
      (await HiveVkusnoitochkaConfig().getRestaurantsBox()).values.toList();

  @override
  Future addRestaurant(AbstractRestaurantModel restaurant) async =>
      (await HiveVkusnoitochkaConfig().getRestaurantsBox())
          .put(restaurant.id, restaurant as VkusnoitochkaRestaurantModel);

  @override
  Future<void> deleteRestaurant(AbstractRestaurantModel restaurant) async {
    (await HiveVkusnoitochkaConfig().getRestaurantsBox()).delete(restaurant.id);
  }

  @override
  Future<String?> getSelectedRestaurant() async =>
      _getSelectedRestaurant(fastfoodName);

  @override
  Future<void> setSelectedRestaurant(String restaurantId) async {
    _setSelectedRestaurant(fastfoodName, restaurantId);
  }
}

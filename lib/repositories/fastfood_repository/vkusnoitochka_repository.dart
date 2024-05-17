part of 'fastfood_repository.dart';

class VkusnoitochkaRepository extends AbstractFastfoodRepository {
  final fastfoodName = HiveVkusnoitochkaConfig.fastfoodName;

  @override
  Future<City?> getCity(String cityId) async =>
      (await HiveVkusnoitochkaConfig().getCitiesBox()).get(cityId);

  @override
  Future<List<AbstractRestaurantModel>> get allRestaurants async {
    final restaurantsUpdateTime = await _getRestaurantsUpdateTime(fastfoodName);
    final rawRestaurantsData =
        (await VIT.getRestaurants(restaurantsUpdateTime)).data;
    final allRestaurantBox =
        await HiveVkusnoitochkaConfig().getAllRestaurantsBox();
    final rawRestaurants = rawRestaurantsData['items'] as List;
    if (rawRestaurants.isNotEmpty) {
      final citiesUpdateTime = await _getCitiesUpdateTime(fastfoodName);
      final rawCitiesData = (await VIT.getCities(citiesUpdateTime)).data;
      final citiesBox = await HiveVkusnoitochkaConfig().getCitiesBox();
      final rawCities = rawCitiesData['items'] as List;
      Map<String, City> cities = {};
      for (var rawCity in rawCities) {
        final city = City.fromJson(rawCity);
        cities[city.id] = city;
      }
      citiesBox.putAll(cities);
      await _setCitiesUpdateTime(
          fastfoodName, (rawCitiesData['lastUpdated'] as int) + 1);

      Map<String, VkusnoitochkaRestaurantModel> restaurants = {};
      for (var rawRestaurant in rawRestaurants) {
        final cityId = rawRestaurant['city'] as String;
        rawRestaurant['city'] = City.toJson(
            citiesBox.get(cityId, defaultValue: const City('None', 'None'))!);
        final restaurant = VkusnoitochkaRestaurantModel.fromJson(rawRestaurant);
        restaurants[restaurant.id] = restaurant;
      }
      allRestaurantBox.putAll(restaurants);
      await _setRestaurantsUpdateTime(
          fastfoodName, (rawRestaurantsData['lastUpdated'] as int) + 1);
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
  Future<AbstractRestaurantModel?> getSelectedRestaurant() async {
    final selectedRestaurantId = await getSelectedRestaurantId();
    try {
      return (await restaurants)
          .firstWhere((element) => element.id == selectedRestaurantId);
    } on StateError {
      return null;
    }
  }

  @override
  Future<String?> getSelectedRestaurantId() async =>
      _getSelectedRestaurantId(fastfoodName);

  @override
  Future<void> setSelectedRestaurant(String restaurantId) async {
    _setSelectedRestaurantId(fastfoodName, restaurantId);
  }

  List<String> _getProductsIdFromCategory(
      List rawCategories, Map<String, dynamic>? rawCategory) {
    if (rawCategory == null) return [];
    List<String> categoryProducts = [];
    for (String subcategoryId in rawCategory['subcategories']) {
      categoryProducts.addAll(_getProductsIdFromCategory(
          rawCategories,
          rawCategories.firstWhere(
            (element) => element['id'] == subcategoryId,
            orElse: () => null,
          )));
    }
    categoryProducts.addAll(
        [for (var product in rawCategory['products']) product.toString()]);
    return categoryProducts.toSet().toList();
  }

  @override
  Future<List<AbstractCategoryModel>> getCategories() async {
    final selectedRestaurant = await getSelectedRestaurant();
    if (selectedRestaurant == null) return [];
    final cityId = selectedRestaurant.city.id;
    // final categoriesUpdateTime = await _getCategoriesUpdateTime(fastfoodName);
    const categoriesUpdateTime = 0;
    final rawCategoriesData = (await VIT.getCatalog(
            cityId: cityId, modifiedTime: categoriesUpdateTime))
        .data;
    final categoriesBox =
        await HiveVkusnoitochkaConfig().getCategoriesBox(cityId);
    final rawCategories = rawCategoriesData['items'] as List;
    if (rawCategories.isNotEmpty) {
      final rootCategories =
          rawCategories.where((element) => element['type'] == 0);
      List<AbstractCategoryModel> categories = [];
      for (var rootCategory in rootCategories) {
        categories.add(VkusnoitochkaCategoryModel(rootCategory['title'],
            _getProductsIdFromCategory(rawCategories, rootCategory)));
      }
      categoriesBox
          .putAll({for (var category in categories) category.name: category});
      await _setCategoriesUpdateTime(
          fastfoodName, (rawCategoriesData['lastUpdated'] as int) + 1);
    }
    return categoriesBox.values.toList();
  }

  @override
  Future<Map<String, List<AbstractProductModel>>>
      getCategoriesProducts() async {
    final selectedRestaurant = await getSelectedRestaurant();
    if (selectedRestaurant == null) return {};
    final cityId = selectedRestaurant.city.id;
    // final productsUpdateTime = await _getProductsUpdateTime(fastfoodName);
    const productsUpdateTime = 0;
    final rawProductsData = (await VIT.getProducts(
            cityId: cityId, modifiedTime: productsUpdateTime))
        .data;
    final productsBox = await HiveVkusnoitochkaConfig().getProductsBox(cityId);
    final rawProducts = rawProductsData['items'] as List;
    if (rawProducts.isNotEmpty) {
      final prices = (await VIT.getPrices(cityId)).data['items'] as List;
      if (prices.isNotEmpty) {
        List<AbstractProductModel> products = [];
        for (var rawProduct in rawProducts) {
          if (!rawProduct['deleted']) {
            rawProduct['price'] = prices.firstWhere(
              (element) => element['product_id'] == rawProduct['productId'],
              orElse: () => {'price': 0},
            )['price'];
            products.add(VkusnoitochkaProductModel.fromJson(rawProduct));
          }
        }
        productsBox
            .putAll({for (var product in products) product.name: product});
        await _setProductsUpdateTime(
            fastfoodName, (rawProductsData['lastUpdated'] as int) + 1);
      }
      final categories = await getCategories();
      return {
        for (var category in categories)
          category.name: productsBox.values
              .where((element) =>
                  element.price != 0 &&
                  element.caloriesCount != 0 &&
                  category.productsIds.contains(element.id))
              .toList()
            ..sort((a, b) => (a.price / a.caloriesCount)
                .compareTo(b.price / b.caloriesCount))
      };
    }
    return {};
  }
}

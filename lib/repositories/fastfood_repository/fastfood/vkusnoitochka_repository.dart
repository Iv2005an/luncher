import 'package:vkusnoitochka_api/vkusnoitochka_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_vkusnoitochka_config.dart';
import '../fastfood_repository.dart';

class VkusnoitochkaRepository extends AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getRestaurants() async {
    final restaurantsBox = await HiveVkusnoitochkaConfig.getRestaurantsBox();
    if (restaurantsBox.isEmpty) {
      saveRestaurantsToLocal(
        restaurantsBox,
        await getRestaurantsFromApi(
          (await VIT.getRestaurants()).data['items'] as List,
          (rawRestaurant) =>
              VkusnoitochkaRestaurantModel.fromJson(rawRestaurant),
        ),
      );
    }
    return getRestaurantsFromLocal(restaurantsBox);
  }
}

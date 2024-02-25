import 'package:burger_king_russia_api/burger_king_russia_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_burgerking_config.dart';
import '../fastfood_repository.dart';

class BurgerkingRepository extends AbstractFastfoodRepository {
  @override
  Future<List<AbstractRestaurantModel>> getRestaurants() async {
    final restaurantsBox = await HiveBurgerkingConfig.getRestaurantsBox();
    if (restaurantsBox.isEmpty) {
      saveRestaurantsToLocal(
        restaurantsBox,
        await getRestaurantsFromApi(
          (await BK.getRestaurants()).data['response']['list'] as List,
          (rawRestaurant) => BurgerkingRestaurantModel.fromJson(rawRestaurant),
        ),
      );
    }
    return getRestaurantsFromLocal(restaurantsBox);
  }
}

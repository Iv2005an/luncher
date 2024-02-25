import 'package:kfc_russia_api/kfc_russia_api.dart';

import 'package:luncher/app/hive_config/hive_fastfood_config/hive_rostics_config.dart';
import '../fastfood_repository.dart';

class RosticsRepository extends AbstractFastfoodRepository {
  @override
  Future<List<RosticsRestaurantModel>> getRestaurants() async {
    final restaurantsBox = await HiveRosticsConfig.getRestaurantsBox();
    if (restaurantsBox.isEmpty) {
      saveRestaurantsToLocal(
        restaurantsBox,
        await getRestaurantsFromApi(
          (await KFC.getRestaurants()).data['searchResults'] as List,
          (rawRestaurant) => RosticsRestaurantModel.fromJson(
            rawRestaurant['storePublic'],
          ),
        ),
      );
    }
    return getRestaurantsFromLocal(restaurantsBox);
  }
}

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';
import '../models/franchise_info.dart';
import 'abstract_restaurants_page.dart';

class RosticsRestaurantsCard extends AbstractRestaurantPage {
  RosticsRestaurantsCard({super.key})
      : super(
          FranchiseInfo(
            RosticsRepository(),
            'assets/svg/rostics_logo.svg',
            'assets/png/rostics_placemark.png',
            'assets/png/rostics_placemark_without_logo.png',
            assetPlacemarkDisabled: 'assets/png/rostics_placemark_disabled.png',
            monochromeAssetLogo: true,
          ),
        );
}

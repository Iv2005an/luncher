import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';
import '../models/franchise_info.dart';
import 'abstract_restaurants_page.dart';

class RosticsRestaurantsCard extends AbstractRestaurantPage {
  RosticsRestaurantsCard({super.key})
      : super(
          FranchiseInfo(
            RosticsRepository(),
            'assets/svg/rostics_logo.svg',
            'assets/svg/rostics_placemark.svg',
            'assets/svg/rostics_placemark_without_logo.svg',
            assetPlacemarkDisabled: 'assets/svg/rostics_placemark_disabled.svg',
            monochromeAssetLogo: true,
          ),
        );
}

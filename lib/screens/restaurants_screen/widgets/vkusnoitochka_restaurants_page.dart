import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';
import '../models/franchise_info.dart';
import 'abstract_restaurants_page.dart';

class VkusnoitochkaRestaurantsPage extends AbstractRestaurantPage {
  VkusnoitochkaRestaurantsPage({super.key})
      : super(
          FranchiseInfo(
            VkusnoitochkaRepository(),
            'assets/svg/vkusnoitochka_logo.svg',
            'assets/svg/vkusnoitochka_placemark.svg',
            'assets/svg/vkusnoitochka_placemark_without_logo.svg',
            assetPlacemarkDisabled:
                'assets/svg/vkusnoitochka_placemark_disabled.svg',
          ),
        );
}

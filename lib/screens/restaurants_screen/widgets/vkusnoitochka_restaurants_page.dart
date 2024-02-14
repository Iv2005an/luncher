import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';
import '../models/franchise_info.dart';
import 'abstract_restaurants_page.dart';

class VkusnoitochkaRestaurantsPage extends AbstractRestaurantPage {
  VkusnoitochkaRestaurantsPage({super.key})
      : super(
          FranchiseInfo(
            VkusnoitochkaRepository(),
            'assets/svg/vkusnoitochka_logo.svg',
            'assets/png/vkusnoitochka_placemark.png',
            'assets/png/vkusnoitochka_placemark_without_logo.png',
            assetPlacemarkDisabled:
                'assets/png/vkusnoitochka_placemark_disabled.png',
          ),
        );
}

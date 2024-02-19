import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';
import '../models/fastfood_info.dart';
import 'abstract_restaurants_page.dart';

class BurgerKingRestaurantsPage extends AbstractRestaurantPage {
  BurgerKingRestaurantsPage({super.key})
      : super(
          FastfoodInfo(
            BurgerkingRepository(),
            'assets/svg/burgerking_logo.svg',
            'assets/png/burgerking_placemark.png',
            'assets/png/burgerking_placemark_without_logo.png',
            assetPlacemarkSelected:
                'assets/png/burgerking_placemark_selected.png',
          ),
        );
}

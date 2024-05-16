import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        // BurgerKingRestaurantsPage(),
        // RosticsRestaurantsCard(),
        VkusnoitochkaRestaurantsPage(),
      ],
    );
  }
}

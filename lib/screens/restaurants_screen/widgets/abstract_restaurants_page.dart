import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:luncher/screens/restaurants_screen/widgets/widgets.dart';

abstract class AbstractRestaurantPage extends StatelessWidget {
  const AbstractRestaurantPage(this.assetName,
      {this.monochrome = false, super.key});
  final String assetName;
  final bool monochrome;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(assetName,
            height: 48,
            colorFilter: monochrome
                ? ColorFilter.mode(
                    Theme.of(context).colorScheme.onBackground, BlendMode.srcIn)
                : null),
      ),
      Expanded(
          child: PageView.builder(
        itemBuilder: (context, index) => const RestaurantCard(),
      ))
    ]);
  }
}

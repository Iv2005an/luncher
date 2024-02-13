import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:luncher/generated/l10n.dart';

import 'package:luncher/screens/restaurants_screen/widgets/widgets.dart';

abstract class AbstractRestaurantPage extends StatelessWidget {
  const AbstractRestaurantPage(this.assetName,
      {this.monochrome = false, super.key});
  final String assetName;
  final bool monochrome;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      )),
      Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () => context.push('/restaurants/addRestaurant'),
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (BuildContext context) {
              //     return Scaffold(
              //         appBar: AppBar(
              //           title: Align(
              //             alignment: Alignment.centerRight,
              //             child: SvgPicture.asset(
              //               'assets/svg/burgerking.svg',
              //               height: 32,
              //             ),
              //           ),
              //         ),
              //         body: const AddRestaurantScreen());
              //   },
              // )),
              child: Text(
                S.of(context).addRestaurant,
                style: TextStyle(color: theme.colorScheme.onBackground),
              ),
            ),
          ))
        ],
      )
    ]);
  }
}

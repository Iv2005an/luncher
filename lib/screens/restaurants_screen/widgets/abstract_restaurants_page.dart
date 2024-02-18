import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:luncher/generated/l10n.dart';
import '../models/fastfood_info.dart';
import 'restaurant_card.dart';

abstract class AbstractRestaurantPage extends StatelessWidget {
  const AbstractRestaurantPage(
    this._fastfoodInfo, {
    super.key,
  });
  final FastfoodInfo _fastfoodInfo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          _fastfoodInfo.assetLogo,
          height: 48,
          colorFilter: _fastfoodInfo.monochromeAssetLogo
              ? ColorFilter.mode(
                  Theme.of(context).colorScheme.onBackground,
                  BlendMode.srcIn,
                )
              : null,
        ),
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
              onPressed: () => context.push(
                '/restaurants/addRestaurant',
                extra: _fastfoodInfo,
              ),
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

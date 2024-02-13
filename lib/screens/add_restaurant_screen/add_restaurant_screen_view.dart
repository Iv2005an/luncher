import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/models/franchise_info.dart';

class AddRestaurantScreen extends StatelessWidget {
  const AddRestaurantScreen(
    this._franchiseInfo, {
    super.key,
  });
  final FranchiseInfo _franchiseInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).restaurants),
            SvgPicture.asset(
              _franchiseInfo.assetPlacemark,
              height: 38,
            ),
          ],
        ),
      ),
      body: const Stack(
        children: [
          YandexMap(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}

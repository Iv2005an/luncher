import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:luncher/generated/l10n.dart';

class AddRestaurantScreen extends StatelessWidget {
  const AddRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).restaurants),
            SvgPicture.asset(
              'assets/svg/burgerking.svg',
              height: 32,
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

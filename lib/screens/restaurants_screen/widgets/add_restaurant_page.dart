import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddRestaurantPage extends StatelessWidget {
  const AddRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        YandexMap(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchBar(),
        ),
      ],
    );
  }
}

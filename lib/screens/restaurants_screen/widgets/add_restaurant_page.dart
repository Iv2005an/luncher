import 'package:flutter/material.dart';

import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:luncher/repositories/fastfood_repository/vkusnoitochka_repository.dart';

class AddRestaurantPage extends StatefulWidget {
  const AddRestaurantPage({super.key});

  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  List<MapObject>? _restaurantsPlacemark;
  Future<void> getRestaurantsMarks() async {
    final restaurantsPlacemark = (await VkusnoitochkaRepository()
            .getRestaurants())
        .map(
          (restaurant) => PlacemarkMapObject(
            mapId: MapObjectId(restaurant.id),
            point: Point(
              latitude: restaurant.latitude,
              longitude: restaurant.longitude,
            ),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                  image:
                      BitmapDescriptor.fromAssetImage('assets/svg/place.png')),
            ),
          ),
        )
        .toList();
    setState(() {
      _restaurantsPlacemark = restaurantsPlacemark;
    });
  }

  @override
  void initState() {
    getRestaurantsMarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (_restaurantsPlacemark == null)
            ? const Center(child: CircularProgressIndicator())
            : YandexMap(
                mapObjects: _restaurantsPlacemark!,
              ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchBar(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/models/franchise_info.dart';
import 'package:luncher/screens/add_restaurant_screen/bloc/add_restaurant_bloc.dart';
import 'package:luncher/screens/add_restaurant_screen/widgets/widgets.dart';

class AddRestaurantScreen extends StatefulWidget {
  const AddRestaurantScreen(
    this._franchiseInfo, {
    super.key,
  });
  final FranchiseInfo _franchiseInfo;
  @override
  State<AddRestaurantScreen> createState() => _AddRestaurantScreenState();
}

class _AddRestaurantScreenState extends State<AddRestaurantScreen> {
  late final AddRestaurantBloc _addRestaurantBloc;
  late final YandexMapController _mapController;
  late double _mapZoom;

  @override
  void initState() {
    _addRestaurantBloc =
        AddRestaurantBloc(widget._franchiseInfo.franchiseRepository);
    _addRestaurantBloc.add(LoadRestaurants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).restaurants),
      ),
      body: BlocBuilder<AddRestaurantBloc, AddRestaurantState>(
        bloc: _addRestaurantBloc,
        builder: (context, state) {
          if (state is AddRestaurantsLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator.adaptive(),
                  const SizedBox(height: 16),
                  Text(S.of(context).uploadingInformationAboutRestaurants),
                ],
              ),
            );
          }
          if (state is AddRestaurantsLoaded) {
            return Stack(
              children: [
                YandexMap(
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  mode2DEnabled: true,
                  nightModeEnabled:
                      Theme.of(context).brightness == Brightness.dark,
                  onMapCreated: (controller) {
                    controller.setMinZoom(zoom: 3);
                    _mapController = controller;
                  },
                  onCameraPositionChanged: (cameraPosition, reason, finished) {
                    if (finished) {
                      setState(() => _mapZoom = cameraPosition.zoom);
                    }
                  },
                  mapObjects: [
                    ClusterizedPlacemarkCollection(
                      mapId: const MapObjectId('restaurantPlacemarksMap'),
                      radius: 60,
                      minZoom: 15,
                      onClusterAdded: (self, cluster) async => cluster.copyWith(
                        appearance: cluster.appearance.copyWith(
                          icon: PlacemarkIcon.single(
                            PlacemarkIconStyle(
                              image: BitmapDescriptor.fromBytes(
                                await ClusterIcon(
                                  widget
                                      ._franchiseInfo.assetPlacemarkWithoutLogo,
                                  cluster.size,
                                ).asBytes(),
                              ),
                            ),
                          ),
                          opacity: 1,
                        ),
                      ),
                      onClusterTap: (self, cluster) async {
                        await _mapController.moveCamera(
                          animation: const MapAnimation(
                              type: MapAnimationType.linear, duration: 0.3),
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: cluster.placemarks.first.point,
                              zoom: ++_mapZoom,
                            ),
                          ),
                        );
                      },
                      placemarks: state.restaurants
                          .map(
                            (restaurant) => PlacemarkMapObject(
                              mapId: MapObjectId(restaurant.id),
                              point: Point(
                                latitude: restaurant.latitude,
                                longitude: restaurant.longitude,
                              ),
                              icon: PlacemarkIcon.single(
                                PlacemarkIconStyle(
                                  image: BitmapDescriptor.fromAssetImage(
                                    widget._franchiseInfo.assetPlacemark,
                                  ),
                                ),
                              ),
                              opacity: 1,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SearchBar(),
                ),
              ],
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).somethingWentWrong),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => _addRestaurantBloc.add(LoadRestaurants()),
                  child: Text(S.of(context).tryAgain),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

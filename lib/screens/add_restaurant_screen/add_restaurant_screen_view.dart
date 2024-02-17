import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/models/franchise_info.dart';
import 'package:luncher/screens/add_restaurant_screen/bloc/add_restaurant_bloc.dart';
import 'package:luncher/screens/add_restaurant_screen/icons/icons.dart';

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
  final _mapKey = GlobalKey();
  late final YandexMapController _mapController;
  late double _mapZoom;

  Future<void> _moveToUserCameraPosition() async {
    final userCameraPosition = await _mapController.getUserCameraPosition();
    if (userCameraPosition != null) {
      _mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            userCameraPosition.copyWith(
                zoom: await _mapController.getMaxZoom() - 7),
          ),
          animation: const MapAnimation());
    }
  }

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
                  key: _mapKey,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  nightModeEnabled:
                      Theme.of(context).brightness == Brightness.dark,
                  mode2DEnabled: true,
                  fastTapEnabled: true,
                  onMapCreated: (controller) async {
                    controller.setMinZoom(zoom: 3);

                    if (await Permission.location.request().isGranted) {
                      controller.toggleUserLayer(
                        visible: true,
                        headingEnabled: false,
                      );
                    }
                    _mapController = controller;
                  },
                  onUserLocationAdded: (view) async {
                    await _moveToUserCameraPosition();
                    final userLocationView = view.pin.copyWith(
                        icon: PlacemarkIcon.single(PlacemarkIconStyle(
                            image: BitmapDescriptor.fromBytes(
                                await UserLocationIcon().asBytes()))));
                    return view.copyWith(
                      pin: userLocationView,
                      arrow: userLocationView,
                      accuracyCircle: view.accuracyCircle.copyWith(
                        strokeWidth: 0,
                        fillColor: Colors.grey.withOpacity(0.5),
                      ),
                    );
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
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: cluster.placemarks.first.point,
                              zoom: ++_mapZoom,
                            ),
                          ),
                          animation: const MapAnimation(duration: 0.5),
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
                Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 32),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton.filled(
                      onPressed: () async => await _moveToUserCameraPosition(),
                      iconSize: 48,
                      icon: const Icon(
                        Icons.navigation,
                      ),
                    ),
                  ),
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

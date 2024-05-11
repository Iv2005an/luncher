import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/models/fastfood_info.dart';
import 'package:luncher/screens/add_restaurant_screen/bloc/add_restaurant_screen_bloc.dart';
import 'package:luncher/screens/add_restaurant_screen/icons/icons.dart';

class AddRestaurantScreen extends StatefulWidget {
  const AddRestaurantScreen(
    this._fastfoodInfo, {
    super.key,
  });
  final FastfoodInfo _fastfoodInfo;
  @override
  State<AddRestaurantScreen> createState() => _AddRestaurantScreenState();
}

class _AddRestaurantScreenState extends State<AddRestaurantScreen> {
  late final AddRestaurantScreenBloc _addRestaurantBloc;
  final _mapKey = GlobalKey();
  late final YandexMapController _mapController;
  final CameraBounds _cameraBounds = const CameraBounds(minZoom: 4);
  late double _mapZoom;

  Future<void> _moveToUserCameraPosition() async {
    final userCameraPosition = await _mapController.getUserCameraPosition();
    if (userCameraPosition != null) {
      _mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            userCameraPosition.copyWith(zoom: _cameraBounds.maxZoom - 7),
          ),
          animation: const MapAnimation());
    }
  }

  @override
  void initState() {
    _addRestaurantBloc =
        AddRestaurantScreenBloc(widget._fastfoodInfo.fastfoodRepository);
    _addRestaurantBloc.add(LoadRestaurants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).restaurants),
      ),
      body: BlocBuilder<AddRestaurantScreenBloc, AddRestaurantScreenState>(
        bloc: _addRestaurantBloc,
        builder: (context, state) {
          if (state is AddRestaurantScreenLoading) {
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
          if (state is AddRestaurantScreenLoaded) {
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
                  cameraBounds: _cameraBounds,
                  onMapCreated: (controller) async {
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
                        opacity: 1,
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
                                      ._fastfoodInfo.assetPlacemarkWithoutLogo,
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
                                latitude: restaurant.location.latitude,
                                longitude: restaurant.location.longitude,
                              ),
                              icon: PlacemarkIcon.single(
                                PlacemarkIconStyle(
                                  image: BitmapDescriptor.fromAssetImage(
                                    widget._fastfoodInfo.assetPlacemark,
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

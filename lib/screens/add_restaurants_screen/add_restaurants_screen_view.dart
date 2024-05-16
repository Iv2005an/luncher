import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/models/fastfood_info.dart';
import 'package:luncher/screens/add_restaurants_screen/bloc/add_restaurants_screen_bloc.dart';
import 'package:luncher/screens/add_restaurants_screen/icons/icons.dart';
import 'widgets/loading_screen.dart';
import 'widgets/widgets.dart';

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
  late final AddRestaurantsScreenBloc _bloc;
  final _mapKey = GlobalKey();
  late final YandexMapController _mapController;
  final CameraBounds _cameraBounds = const CameraBounds(minZoom: 4);
  late double _mapZoom;

  Future<void> _moveToUserCameraPosition() async {
    if (await Permission.location.request().isGranted) {
      _mapController.toggleUserLayer(
        visible: true,
        headingEnabled: false,
      );
    }
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
    _bloc = AddRestaurantsScreenBloc(widget._fastfoodInfo.fastfoodRepository);
    _bloc.add(LoadRestaurants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).restaurants),
      ),
      body: BlocBuilder<AddRestaurantsScreenBloc, AddRestaurantsScreenState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is AddRestaurantsScreenLoaded) {
              return Stack(
                children: [
                  YandexMap(
                    key: _mapKey,
                    tiltGesturesEnabled: false,
                    rotateGesturesEnabled: false,
                    nightModeEnabled: theme.brightness == Brightness.dark,
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
                    onCameraPositionChanged:
                        (cameraPosition, reason, finished) {
                      if (finished) {
                        setState(() => _mapZoom = cameraPosition.zoom);
                      }
                    },
                    mapObjects: [
                      ClusterizedPlacemarkCollection(
                        mapId: const MapObjectId('restaurantsPlacemarksMap'),
                        radius: 60,
                        minZoom: 15,
                        onClusterAdded: (self, cluster) async =>
                            cluster.copyWith(
                          appearance: cluster.appearance.copyWith(
                            icon: PlacemarkIcon.single(
                              PlacemarkIconStyle(
                                image: BitmapDescriptor.fromBytes(
                                  await ClusterIcon(
                                    widget._fastfoodInfo
                                        .assetPlacemarkWithoutLogo,
                                    cluster.size,
                                  ).asBytes(),
                                ),
                              ),
                            ),
                            opacity: 1,
                          ),
                        ),
                        onClusterTap: (self, cluster) async =>
                            await _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: cluster.placemarks.first.point,
                              zoom: ++_mapZoom,
                            ),
                          ),
                          animation: const MapAnimation(duration: 0.5),
                        ),
                        placemarks: state.restaurants
                            .map(
                              (restaurant) => PlacemarkMapObject(
                                  mapId: MapObjectId(restaurant.id),
                                  point: Point(
                                      latitude: restaurant.location.latitude
                                          .toDouble(),
                                      longitude: restaurant.location.longitude
                                          .toDouble()),
                                  icon: PlacemarkIcon.single(
                                    PlacemarkIconStyle(
                                      image: BitmapDescriptor.fromAssetImage(
                                        widget._fastfoodInfo.assetPlacemark,
                                      ),
                                    ),
                                  ),
                                  opacity: 1,
                                  onTap: (mapObject, point) {
                                    _mapController.moveCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                            target: Point(
                                                latitude:
                                                    mapObject.point.latitude -
                                                        0.0005,
                                                longitude:
                                                    mapObject.point.longitude),
                                            zoom: _cameraBounds.maxZoom,
                                          ),
                                        ),
                                        animation:
                                            const MapAnimation(duration: 0.5));
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return AddRestaurantBottomSheet(
                                              _bloc, restaurant);
                                        });
                                  }),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  MyPositionButton(_moveToUserCameraPosition),
                ],
              );
            }
            if (state is AddRestaurantsScreenFailure) {
              return SomethingWrongScreen(_bloc);
            }
            return const LoadingScreen();
          }),
    );
  }
}

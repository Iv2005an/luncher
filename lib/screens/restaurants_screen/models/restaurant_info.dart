import 'restaurant_service.dart';

class RestaurantInfo {
  RestaurantInfo(
    this.address,
    this.metroStations,
    this.workTime,
    this.services,
  );
  final String address;
  final List<String>? metroStations;
  final DateTime workTime;
  final List<Service> services;
}

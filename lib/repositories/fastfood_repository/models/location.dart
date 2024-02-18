import 'package:equatable/equatable.dart';

class Location extends Equatable {
  Location(num longitude, num latitude) {
    this.longitude = longitude.toDouble();
    this.latitude = latitude.toDouble();
  }
  late final double longitude;
  late final double latitude;

  @override
  List<Object?> get props => [longitude, latitude];
}

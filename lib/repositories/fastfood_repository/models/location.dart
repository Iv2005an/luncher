import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'location.g.dart';

@HiveType(typeId: 0)
class Location extends Equatable {
  Location(num longitude, num latitude) {
    this.longitude = longitude.toDouble();
    this.latitude = latitude.toDouble();
  }

  @HiveField(0)
  late final double longitude;

  @HiveField(1)
  late final double latitude;

  @override
  List<Object?> get props => [longitude, latitude];
}

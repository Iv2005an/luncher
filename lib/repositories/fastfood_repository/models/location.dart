import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'location.g.dart';

@HiveType(typeId: 0)
class Location extends Equatable {
  const Location(this.longitude, this.latitude);

  @HiveField(0)
  final num longitude;

  @HiveField(1)
  final num latitude;

  @override
  List<Object?> get props => [longitude, latitude];
}

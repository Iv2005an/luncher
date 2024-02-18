import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location(this.longitude, this.latitude);
  final double longitude;
  final double latitude;

  @override
  List<Object?> get props => [longitude, latitude];
}

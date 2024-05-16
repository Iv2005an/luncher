import 'package:equatable/equatable.dart';

import 'location.dart';
import 'metro.dart';

abstract class AbstractRestaurantModel extends Equatable {
  const AbstractRestaurantModel();
  String get id;
  String get address;
  Location get location;
  List<Metro> get metroList;

  @override
  List<Object?> get props => [id, address, location, metroList];
}

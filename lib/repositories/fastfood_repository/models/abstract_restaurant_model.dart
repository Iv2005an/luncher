import 'package:equatable/equatable.dart';

import 'location.dart';

abstract class AbstractRestaurantModel extends Equatable {
  const AbstractRestaurantModel();
  String get id;
  String get address;
  Location get location;

  @override
  List<Object?> get props => [];
}

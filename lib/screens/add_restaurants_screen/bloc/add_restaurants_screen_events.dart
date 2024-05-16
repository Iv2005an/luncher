part of 'add_restaurants_screen_bloc.dart';

abstract interface class AddRestaurantsEvent {}

class LoadRestaurants implements AddRestaurantsEvent {}

class AddRestaurant implements AddRestaurantsEvent {
  AddRestaurant(this.restaurant);
  final AbstractRestaurantModel restaurant;
}

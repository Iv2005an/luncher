part of 'add_restaurant_bloc.dart';

class AddRestaurantState {}

class AddRestaurantInitial extends AddRestaurantState {}

class AddRestaurantsLoading extends AddRestaurantState {}

class AddRestaurantsLoaded extends AddRestaurantState {
  AddRestaurantsLoaded(this.restaurants);
  final List<RestaurantModel> restaurants;
}

class AddRestaurantsFailure extends AddRestaurantState {}

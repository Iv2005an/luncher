part of 'restaurants_screen_bloc.dart';

abstract interface class RestaurantsScreenEvent {}

class LoadRestaurants implements RestaurantsScreenEvent {}

class SelectRestaurant implements RestaurantsScreenEvent {
  SelectRestaurant(this.restaurantId);
  final String restaurantId;
}

class DeleteRestaurant implements RestaurantsScreenEvent {
  DeleteRestaurant(this.restaurant);
  final AbstractRestaurantModel restaurant;
}

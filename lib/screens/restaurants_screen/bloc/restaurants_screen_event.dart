part of 'restaurants_screen_bloc.dart';

sealed class RestaurantsScreenEvent extends Equatable {
  const RestaurantsScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurantsEvent extends RestaurantsScreenEvent {}

class SelectRestaurantEvent extends RestaurantsScreenEvent {
  const SelectRestaurantEvent(this.restaurantId);
  final String restaurantId;

  @override
  List<Object> get props => [restaurantId];
}

class DeleteRestaurantEvent extends RestaurantsScreenEvent {
  const DeleteRestaurantEvent(this.restaurant);
  final AbstractRestaurantModel restaurant;

  @override
  List<Object> get props => [restaurant];
}

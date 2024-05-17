part of 'add_restaurants_screen_bloc.dart';

sealed class AddRestaurantsScreenEvent extends Equatable {
  const AddRestaurantsScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurantsEvent extends AddRestaurantsScreenEvent {}

class AddRestaurantEvent extends AddRestaurantsScreenEvent {
  const AddRestaurantEvent(this.restaurant);
  final AbstractRestaurantModel restaurant;

  @override
  List<Object> get props => [restaurant];
}

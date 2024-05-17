part of 'add_restaurants_screen_bloc.dart';

sealed class AddRestaurantsScreenState extends Equatable {
  const AddRestaurantsScreenState();

  @override
  List<Object> get props => [];
}

class AddRestaurantsScreenInitial extends AddRestaurantsScreenState {}

class AddRestaurantsScreenLoading extends AddRestaurantsScreenState {}

class AddRestaurantsScreenLoaded extends AddRestaurantsScreenState {
  const AddRestaurantsScreenLoaded(this.restaurants);
  final List<AbstractRestaurantModel> restaurants;

  @override
  List<Object> get props => [restaurants];
}

class AddRestaurantsScreenFailed extends AddRestaurantsScreenState {
  const AddRestaurantsScreenFailed(this.exception);
  final Object exception;

  @override
  List<Object> get props => [exception];
}

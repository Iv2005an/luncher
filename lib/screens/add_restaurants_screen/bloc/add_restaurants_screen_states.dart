part of 'add_restaurants_screen_bloc.dart';

abstract class AddRestaurantsScreenState extends Equatable {}

class AddRestaurantsScreenInitial extends AddRestaurantsScreenState {
  @override
  List<Object?> get props => [];
}

class AddRestaurantsScreenLoading extends AddRestaurantsScreenState {
  @override
  List<Object?> get props => [];
}

class AddRestaurantsScreenLoaded extends AddRestaurantsScreenState {
  AddRestaurantsScreenLoaded(this.restaurants);
  final List<AbstractRestaurantModel> restaurants;

  @override
  List<Object?> get props => [restaurants];
}

class AddRestaurantsScreenFailure extends AddRestaurantsScreenState {
  AddRestaurantsScreenFailure(this.exception);
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

part of 'restaurants_screen_bloc.dart';

abstract class RestaurantsScreenState extends Equatable {}

class RestaurantsScreenInitial extends RestaurantsScreenState {
  @override
  List<Object?> get props => [];
}

class RestaurantsScreenLoading extends RestaurantsScreenState {
  @override
  List<Object?> get props => [];
}

class RestaurantsScreenLoaded extends RestaurantsScreenState {
  RestaurantsScreenLoaded(this.restaurants, this.selectedRestaurantId);
  final List<AbstractRestaurantModel> restaurants;
  final int selectedRestaurantId;

  @override
  List<Object?> get props => [restaurants, selectedRestaurantId];
}

class RestaurantsScreenEmpty extends RestaurantsScreenState {
  @override
  List<Object?> get props => [];
}

class RestaurantsScreenFailure extends RestaurantsScreenState {
  RestaurantsScreenFailure(this.exception);
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

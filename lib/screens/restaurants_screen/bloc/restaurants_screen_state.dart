part of 'restaurants_screen_bloc.dart';

sealed class RestaurantsScreenState extends Equatable {
  const RestaurantsScreenState();

  @override
  List<Object?> get props => [];
}

class RestaurantsScreenInitial extends RestaurantsScreenState {}

class RestaurantsScreenLoading extends RestaurantsScreenState {}

class RestaurantsScreenLoaded extends RestaurantsScreenState {
  const RestaurantsScreenLoaded(this.restaurants, this.selectedRestaurantId);
  final List<AbstractRestaurantModel> restaurants;
  final int selectedRestaurantId;

  @override
  List<Object> get props => [restaurants, selectedRestaurantId];
}

class RestaurantsScreenEmpty extends RestaurantsScreenState {}

class RestaurantsScreenFailed extends RestaurantsScreenState {
  const RestaurantsScreenFailed(this.exception);
  final Object exception;

  @override
  List<Object> get props => [exception];
}

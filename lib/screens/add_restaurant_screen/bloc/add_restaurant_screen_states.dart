part of 'add_restaurant_screen_bloc.dart';

abstract class AddRestaurantScreenState extends Equatable {}

class AddRestaurantScreenInitial extends AddRestaurantScreenState {
  @override
  List<Object?> get props => [];
}

class AddRestaurantScreenLoading extends AddRestaurantScreenState {
  @override
  List<Object?> get props => [];
}

class AddRestaurantScreenLoaded extends AddRestaurantScreenState {
  AddRestaurantScreenLoaded(this.restaurants);
  final List<AbstractRestaurantModel> restaurants;

  @override
  List<Object?> get props => [restaurants];
}

class AddRestaurantScreenFailure extends AddRestaurantScreenState {
  AddRestaurantScreenFailure(this.exception);
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

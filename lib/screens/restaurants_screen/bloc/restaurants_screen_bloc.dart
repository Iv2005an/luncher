import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'restaurants_screen_events.dart';
part 'restaurants_screen_states.dart';

class RestaurantsScreenBloc
    extends Bloc<RestaurantsScreenEvent, RestaurantsScreenState> {
  RestaurantsScreenBloc(this.restaurantsRepository)
      : super(RestaurantsScreenInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(RestaurantsScreenLoading());
      try {
        final restaurants = await restaurantsRepository.restaurants;
        if (restaurants.isEmpty) {
          emit(RestaurantsScreenEmpty());
        } else {
          final selectedRestaurant =
              await restaurantsRepository.getSelectedRestaurant();
          int selectedRestaurantId = restaurants
              .indexWhere((restaurant) => restaurant.id == selectedRestaurant);
          if (selectedRestaurantId == -1) {
            selectedRestaurantId = 0;
            add(SelectRestaurant(restaurants.first.id));
          }
          emit(RestaurantsScreenLoaded(
              restaurants,
              (selectedRestaurant != null)
                  ? restaurants
                      .indexWhere((element) => element.id == selectedRestaurant)
                  : 0));
        }
      } catch (exception, stackTrace) {
        debugPrint('${exception.toString()}\n${stackTrace.toString()}');
        emit(RestaurantsScreenFailure(exception));
      }
    });
    on<SelectRestaurant>((event, emit) async =>
        await restaurantsRepository.setSelectedRestaurant(event.restaurantId));
    on<DeleteRestaurant>((event, emit) async {
      await restaurantsRepository.deleteRestaurant(event.restaurant);
      add(LoadRestaurants());
    });
  }
  final AbstractFastfoodRepository restaurantsRepository;
}

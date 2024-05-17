import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'restaurants_screen_event.dart';
part 'restaurants_screen_state.dart';

class RestaurantsScreenBloc
    extends Bloc<RestaurantsScreenEvent, RestaurantsScreenState> {
  RestaurantsScreenBloc(this.restaurantsRepository)
      : super(RestaurantsScreenInitial()) {
    on<LoadRestaurantsEvent>((event, emit) async {
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
            add(SelectRestaurantEvent(restaurants.first.id));
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
        emit(RestaurantsScreenFailed(exception));
      }
    });
    on<SelectRestaurantEvent>((event, emit) async =>
        await restaurantsRepository.setSelectedRestaurant(event.restaurantId));
    on<DeleteRestaurantEvent>((event, emit) async {
      await restaurantsRepository.deleteRestaurant(event.restaurant);
      add(LoadRestaurantsEvent());
    });
  }
  final AbstractFastfoodRepository restaurantsRepository;
}

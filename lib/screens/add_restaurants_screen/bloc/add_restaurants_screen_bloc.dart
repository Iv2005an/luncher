import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'add_restaurants_screen_event.dart';
part 'add_restaurants_screen_state.dart';

class AddRestaurantsScreenBloc
    extends Bloc<AddRestaurantsScreenEvent, AddRestaurantsScreenState> {
  AddRestaurantsScreenBloc(this.restaurantsRepository)
      : super(AddRestaurantsScreenInitial()) {
    on<LoadRestaurantsEvent>((event, emit) async {
      emit(AddRestaurantsScreenLoading());
      try {
        emit(AddRestaurantsScreenLoaded(
            await restaurantsRepository.allRestaurants));
      } catch (exception, stackTrace) {
        debugPrint('${exception.toString()}\n${stackTrace.toString()}');
        emit(AddRestaurantsScreenFailed(exception));
      }
    });
    on<AddRestaurantEvent>((event, emit) async {
      await restaurantsRepository.addRestaurant(event.restaurant);
    });
  }
  final AbstractFastfoodRepository restaurantsRepository;
}

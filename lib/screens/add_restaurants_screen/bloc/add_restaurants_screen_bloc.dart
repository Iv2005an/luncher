import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'add_restaurants_screen_events.dart';
part 'add_restaurants_screen_states.dart';

class AddRestaurantsScreenBloc
    extends Bloc<AddRestaurantsEvent, AddRestaurantsScreenState> {
  AddRestaurantsScreenBloc(this.restaurantsRepository)
      : super(AddRestaurantsScreenInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(AddRestaurantsScreenLoading());
      try {
        emit(AddRestaurantsScreenLoaded(
            await restaurantsRepository.allRestaurants));
      } catch (exception, stackTrace) {
        debugPrint('${exception.toString()}\n${stackTrace.toString()}');
        emit(AddRestaurantsScreenFailure(exception));
      }
    });
    on<AddRestaurant>((event, emit) async {
      await restaurantsRepository.addRestaurant(event.restaurant);
    });
  }
  final AbstractFastfoodRepository restaurantsRepository;
}

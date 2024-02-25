import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'add_restaurant_screen_events.dart';
part 'add_restaurant_screen_states.dart';

class AddRestaurantScreenBloc
    extends Bloc<AddRestaurantEvent, AddRestaurantScreenState> {
  AddRestaurantScreenBloc(this.restaurantRepository)
      : super(AddRestaurantScreenInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(AddRestaurantScreenLoading());
      try {
        emit(AddRestaurantScreenLoaded(
            await restaurantRepository.getRestaurants()));
      } catch (exception, stackTrace) {
        debugPrint('${exception.toString()}\n${stackTrace.toString()}');
        emit(AddRestaurantScreenFailure(exception));
      }
    });
  }
  final AbstractFastfoodRepository restaurantRepository;
}

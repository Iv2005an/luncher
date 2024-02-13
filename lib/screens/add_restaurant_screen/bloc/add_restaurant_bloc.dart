import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'add_restaurant_events.dart';
part 'add_restaurant_states.dart';

class AddRestaurantBloc extends Bloc<AddRestaurantEvent, AddRestaurantState> {
  AddRestaurantBloc(this.restaurantRepository) : super(AddRestaurantInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(AddRestaurantsLoading());
      try {
        emit(AddRestaurantsLoaded(await restaurantRepository.getRestaurants()));
      } catch (exception) {
        emit(AddRestaurantsFailure());
      }
    });
  }
  final AbstractFranchiseRepository restaurantRepository;
}

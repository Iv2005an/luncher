import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

part 'offers_screen_event.dart';
part 'offers_screen_state.dart';

class OffersScreenBloc extends Bloc<OffersScreenEvent, OffersScreenState> {
  OffersScreenBloc() : super(OffersScreenInitial()) {
    on<LoadCatalogEvent>((event, emit) async {
      emit(OffersScreenLoading());
      try {
        final categoryProducts =
            await VkusnoitochkaRepository().getCategoriesProducts();
        if (categoryProducts.isEmpty) {
          emit(OffersScreenEmpty());
        } else {
          emit(OffersScreenLoaded(categoryProducts));
        }
      } catch (exception, stackTrace) {
        debugPrint('${exception.toString()}\n${stackTrace.toString()}');
        emit(OffersScreenFailed(exception));
      } finally {
        event.completer?.complete();
      }
    });
  }
}

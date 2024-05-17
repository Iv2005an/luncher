part of 'offers_screen_bloc.dart';

sealed class OffersScreenEvent extends Equatable {
  const OffersScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoadCatalogEvent extends OffersScreenEvent {
  const LoadCatalogEvent({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

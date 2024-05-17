part of 'offers_screen_bloc.dart';

sealed class OffersScreenState extends Equatable {
  const OffersScreenState();

  @override
  List<Object> get props => [];
}

final class OffersScreenInitial extends OffersScreenState {}

final class OffersScreenLoading extends OffersScreenState {}

final class OffersScreenEmpty extends OffersScreenState {}

final class OffersScreenLoaded extends OffersScreenState {
  const OffersScreenLoaded(this.products);
  final Map<String, List<AbstractProductModel>> products;

  @override
  List<Object> get props => [products];
}

final class OffersScreenFailed extends OffersScreenState {
  const OffersScreenFailed(this.exception);
  final Object exception;

  @override
  List<Object> get props => [exception];
}

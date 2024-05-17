import 'package:equatable/equatable.dart';

abstract class AbstractProductModel extends Equatable {
  const AbstractProductModel();

  String get id;
  String get name;
  double get caloriesCount;
  double get price;

  @override
  List<Object?> get props => [id, name, caloriesCount, price];
}

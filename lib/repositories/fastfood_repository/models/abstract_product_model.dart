import 'package:equatable/equatable.dart';

abstract class AbstractProductModel extends Equatable {
  const AbstractProductModel();
  String get id;
  String get name;
  int get calCount;
  int get price;

  @override
  List<Object?> get props => [id, name, calCount, price];
}

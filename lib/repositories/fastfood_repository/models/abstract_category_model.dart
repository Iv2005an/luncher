import 'package:equatable/equatable.dart';

abstract class AbstractCategoryModel extends Equatable {
  const AbstractCategoryModel();

  String get name;
  List<String> get productsIds;

  @override
  List<Object> get props => [name, productsIds];
}

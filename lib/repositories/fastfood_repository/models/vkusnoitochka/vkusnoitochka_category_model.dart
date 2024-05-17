import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'vkusnoitochka_category_model.g.dart';

@JsonSerializable(createToJson: false)
@HiveType(typeId: 6)
class VkusnoitochkaCategoryModel extends AbstractCategoryModel {
  const VkusnoitochkaCategoryModel(this.name, this.productsIds);

  @HiveField(0)
  @override
  final String name;

  @HiveField(1)
  @override
  final List<String> productsIds;
}

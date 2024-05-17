import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class City extends Equatable {
  const City(this.id, this.name);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  static Map<String, dynamic> toJson(City instance) => _$CityToJson(instance);

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  @override
  List<Object?> get props => [id, name];
}

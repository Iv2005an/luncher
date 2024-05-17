import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'metro.g.dart';

@HiveType(typeId: 2)
class Metro extends Equatable {
  const Metro(this.name, this.color, this.distance);

  @HiveField(0)
  final String name;

  @HiveField(1)
  final int color;

  @HiveField(2)
  final num distance;

  @override
  List<Object> get props => [name, color, distance];
}

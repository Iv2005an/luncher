import 'package:hive_flutter/hive_flutter.dart';

part 'metro.g.dart';

@HiveType(typeId: 1)
class Metro {
  Metro(this.name, this.color, this.distance);

  @HiveField(0)
  final String name;

  @HiveField(1)
  final int color;

  @HiveField(2)
  final num distance;
}

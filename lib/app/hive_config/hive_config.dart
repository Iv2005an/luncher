import 'package:hive_flutter/hive_flutter.dart';

import 'hive_fastfood_config/hive_abstract_fastfood_config.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    AbstractHiveFastfoodConfig.init();
  }
}

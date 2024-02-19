import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  await HiveConfig.init();
  runApp(const AppWidget());
}

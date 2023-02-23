import 'package:flutter/material.dart';
import 'package:test_synapsisid/app.dart';
import 'package:test_synapsisid/common/module/di/di_init_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}

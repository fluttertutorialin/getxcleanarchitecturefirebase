import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'utils/config/app_config.dart';
import 'app.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeJsonMapper();

  await Firebase.initializeApp();
  await GetStorage.init();
  await AppConfig.loadEnv();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

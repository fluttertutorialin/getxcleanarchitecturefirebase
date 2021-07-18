import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/config/app_binding.dart';
import 'utils/config/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //GetCupertinoApp
      title: 'GetX Clean Architecture Firebase',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.routeExampleLoginScreen,
      initialBinding: AppBinding(),
      getPages: AppRoute.generateGetPages,
    );
  }
}

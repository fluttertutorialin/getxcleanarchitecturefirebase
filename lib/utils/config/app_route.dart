import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../presentation/controllers/home/home_binding.dart';
import '../../presentation/controllers/home_detail/home_detail_binding.dart';
import '../../presentation/controllers/login/login_binding.dart';
import '../../presentation/views/home_detail_page.dart';
import '../../presentation/views/home_page.dart';
import '../../presentation/views/login_page.dart';
import '../service/auth_service.dart';

class AppRoute {
  static String routeHomeScreen = '/';
  static String routeDetailScreen = '/detail';

  // Example
  static String routeExampleLoginScreen = '/example_login';
  static String routeExampleHomeScreen = '/example_home';
  static String routeExampleHomeDetailScreen =
      '$routeExampleHomeScreen$routeDetailScreen';

  static List<GetPage> generateGetPages = [
    GetPage(
      name: routeExampleLoginScreen,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: routeExampleHomeScreen,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
      children: [
        GetPage(
          name: routeDetailScreen,
          page: () => HomeDetailPage(),
          binding: HomeDetailBinding(),
          transition: Transition.cupertino,
        ),
      ],
    ),
  ];
}

class AuthenMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route, {Object? arguments}) {
    final isLogged = Get.find<AuthService>().hasLogin();
    return isLogged
        ? null
        : RouteSettings(
            name: AppRoute.routeExampleLoginScreen,
            arguments: arguments,
          );
  }
}

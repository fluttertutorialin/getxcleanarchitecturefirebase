import 'package:flutter/widgets.dart';
import '../../../base/presentation/base_controller.dart';
import '../home_detail/home_detail_input.dart';
import '../../../utils/config/app_navigation.dart';

class HomeController extends BaseController {
  final testTextEditingController = TextEditingController();

  void onPushToDetail(HomeDetailInput input) {
    input.username += testTextEditingController.text;
    input.password += testTextEditingController.text;

    RouteNavigation.toHomeDetail(input: input);
  }
}

import 'package:get/get.dart';
import 'home_detail_controller.dart';

class HomeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeDetailController());
  }
}

import '../../../base/presentation/base_controller.dart';
import '../../../utils/service/log_service.dart';
import 'home_detail_input.dart';

class HomeDetailController
    extends BaseController<HomeDetailInput> {
  late String username;
  late String password;

  @override
  void onInit() {
    super.onInit();
    username = input.username;
    password = input.password;
    testLog();
  }

  void testLog() {
    Log.verbose("Verbose log");
    Log.debug("Debug log");
    Log.info("Info log");
    Log.warning("Warning log");
    Log.error("Error log");
    Log.wtf("What a terrible failure log");
  }
}

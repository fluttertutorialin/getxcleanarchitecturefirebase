import 'package:get/get.dart';
import '../../../data/repositories_impl/auth_repo_impl.dart';
import '../../../domain/usecases/auth/login_uc.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginByGoogleUseCase(Get.find<AuthRepoImpl>()));
    Get.lazyPut(() => LoginByEmailUseCase(Get.find<AuthRepoImpl>()));
    Get.lazyPut(
      () => LoginController(
        loginEmailUseCase: Get.find(),
        loginGoogleUseCase: Get.find(),
      ),
    );
  }
}

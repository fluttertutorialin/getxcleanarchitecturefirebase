import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/domain/base_observer.dart';
import '../../../base/domain/base_state.dart';
import '../../../base/presentation/base_controller.dart';
import '../../../domain/usecases/auth/login_uc.dart';
import '../../../utils/config/app_navigation.dart';

class LoginController extends BaseController {
  LoginController({
    required LoginByGoogleUseCase loginGoogleUseCase,
    required LoginByEmailUseCase loginEmailUseCase,
  })  : _loginGoogleUseCase = loginGoogleUseCase,
        _loginEmailUseCase = loginEmailUseCase;

  final LoginByGoogleUseCase _loginGoogleUseCase;
  final LoginByEmailUseCase _loginEmailUseCase;

  final usernameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final loginState = BaseState();

  void onPushToHome() {
    RouteNavigation.toHome(type: RouteType.offAll);
  }

  void onSuccessTest() {
    _loginGoogleUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          Get.dialog(const Center(child: CircularProgressIndicator(strokeWidth: 1.5)));
          loginState.onLoading();
        },
        onSuccess: (value) {
          Get.back();

          loginState.onSuccess(data: value.listen((event) {
            event.length.toString();
          }));
          value.listen((event) {
            print(event[0].lastName);
          });
        },
        onError: (dynamic e) {
          Get.back();

          loginState.onError(e.toString());
        },
      ),
    );
  }

  void onErrorTest() {
    _loginEmailUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          Get.dialog(const Center(child: CircularProgressIndicator(strokeWidth: 1.5)));
          loginState.onLoading();
        },
        onSuccess: (_) {
          Get.back();
          loginState.onSuccess();
        },
        onError: (dynamic e) {
          Get.back();
          loginState.onError(e.toString());
        },
      ),
      input: LoginEmailInput(
        "usernameTextEditingController.text",
        "passwordTextEditingController.text",
      ),
    );
  }

  void onCrashTest() {
    print([][1]);
  }

  @override
  void dispose() {
    usernameTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }
}

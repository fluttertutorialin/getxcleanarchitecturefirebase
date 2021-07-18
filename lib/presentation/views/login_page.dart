import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:int_quest/base/domain/base_state.dart';
import '../controllers/login/login_controller.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
              controller: controller.usernameTextEditingController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.passwordTextEditingController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 55,
            ),
            ElevatedButton(
              onPressed: () => controller.onPushToHome(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: const Center(
                  child: Text('Push home test'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => controller.onSuccessTest(),
              child: const Text('Login success test'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => controller.onErrorTest(),
              child: const Text('Login error test'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => controller.onCrashTest(),
              child: const Text('Crash test'),
            ),

            //TODO STATE MIXIN
            /*controller.loginState.obx(
              (state) => const Text('ddd'),
              onLoading: const Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
              onError: (error) => Text('Error $error'),
            ),*/
          ],
        ),
      ),
    );
  }

  @swidget
  AppBar appBarWidget() {
    return AppBar(
      title: const Text("Example page"),
    );
  }
}

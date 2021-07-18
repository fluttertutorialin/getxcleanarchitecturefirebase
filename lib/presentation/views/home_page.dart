import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home/home_controller.dart';
import '../controllers/home_detail/home_detail_input.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home page example"),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'test number',
                ),
                controller: controller.testTextEditingController,
              ),
              TextButton(
                onPressed: () => controller.onPushToDetail(
                  HomeDetailInput("username", "password"),
                ),
                child: const Text('Push to detail'),
              ),
              const Center(
                child: SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

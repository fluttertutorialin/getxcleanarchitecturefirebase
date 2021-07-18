import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_detail/home_detail_controller.dart';

class HomeDetailPage extends GetView<HomeDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home page detail example"),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.username),
              const Center(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Text(controller.password),
            ],
          ),
        ],
      ),
    );
  }
}

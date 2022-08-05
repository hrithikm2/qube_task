import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qube_task/constants/app_constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  FirstPageView({Key? key}) : super(key: key);
  final FirstPageController firstPageController =
      Get.put(FirstPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('FirstPageView').text.black.make(),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          color: appGreen,
          onPressed: () => controller.moveToSecond(),
          child: 'Click me to go to second page'.text.make(),
        ),
      ),
    );
  }
}

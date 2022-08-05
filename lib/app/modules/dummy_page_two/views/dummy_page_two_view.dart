import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/app_constants.dart';
import '../controllers/dummy_page_two_controller.dart';

class DummyPageTwoView extends GetView<DummyPageTwoController> {
  DummyPageTwoView({Key? key}) : super(key: key);
  final DummyPageTwoController dummyPageTwoController =
      Get.put(DummyPageTwoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Dummy Page 2').text.black.make(),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          color: appGreen,
          onPressed: () => controller.goToHome(),
          child: 'UI THIS WAY >>> '.text.make(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_task/app/modules/home/views/home_view.dart';

class DummyPageTwoController extends GetxController {
  final count = 0.obs;

  @override
  void onReady() {
    Get.snackbar("Now let's move to the UI Page", "",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.8));
    super.onReady();
  }

  void goToHome() {
    Get.closeAllSnackbars();
    Get.to(() => HomeView());
  }
}

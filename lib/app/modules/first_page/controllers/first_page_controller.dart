import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dummy_page_two/views/dummy_page_two_view.dart';

class FirstPageController extends GetxController {
  @override
  void onReady() {
    Get.snackbar("Click the green button to move to second page", "",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.8));
    super.onReady();
  }

  void moveToSecond() {
    Get.closeCurrentSnackbar();
    Get.to(() => DummyPageTwoView());
  }
}

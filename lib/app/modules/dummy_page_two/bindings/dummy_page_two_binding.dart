import 'package:get/get.dart';

import '../controllers/dummy_page_two_controller.dart';

class DummyPageTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DummyPageTwoController>(
      () => DummyPageTwoController(),
    );
  }
}

import 'package:get/get.dart';

import '../modules/dummy_page_two/bindings/dummy_page_two_binding.dart';
import '../modules/dummy_page_two/views/dummy_page_two_view.dart';
import '../modules/first_page/bindings/first_page_binding.dart';
import '../modules/first_page/views/first_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FIRST_PAGE,
      page: () => FirstPageView(),
      binding: FirstPageBinding(),
    ),
    GetPage(
      name: _Paths.DUMMY_PAGE_TWO,
      page: () => DummyPageTwoView(),
      binding: DummyPageTwoBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:sanberapp/Tugas/Tugas-15/pages/page_1.dart';
import 'package:sanberapp/Tugas/Tugas-15/pages/page_2.dart';
import 'package:sanberapp/Tugas/Tugas-15/pages/page_3.dart';
import 'package:sanberapp/Tugas/Tugas-15/routes/route_name.dart';

class pageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.page_1,
      page: () => PageOne(),
    ), // GetPage

    GetPage(
      name: RouteName.page_2,
      page: () => PageTwo(),
    ), // GetPage

    GetPage(
      name: RouteName.page_3,
      page: () => Pagethree(),
    ), // GetPage
  ];
}

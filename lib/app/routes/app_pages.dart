import 'package:get/get.dart';

import '../modules/barang/bindings/barang_binding.dart';
import '../modules/barang/views/barang_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_barang/bindings/detail_barang_binding.dart';
import '../modules/detail_barang/views/detail_barang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BARANG,
      page: () => const BarangView(),
      binding: BarangBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BARANG,
      page: () => const DetailBarangView(),
      binding: DetailBarangBinding(),
    ),
  ];
}

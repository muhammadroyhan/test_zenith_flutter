import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_zenith/app/routes/app_pages.dart' as app_routes;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: app_routes.AppPages.INITIAL,
      getPages: app_routes.AppPages.routes,
    );
  }
}


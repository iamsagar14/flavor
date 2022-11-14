import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flavor_core/config/config.dart';

import 'package:flavor_core/app/routes/app_pages.dart';

void main() async {
  Config.currentFlavor = Flavor.staging;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

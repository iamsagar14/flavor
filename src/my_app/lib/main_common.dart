// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:flavor_core/app/routes/app_pages.dart';
import 'package:flavor_core/config/config.dart';
import 'package:flavor_core/services/locator.dart' as di;

void mainCommon({required Flavor flavor}) async {
  di.initLocator();
  di.locator.get<Config>().currentFlavor = flavor;
  runApp(
    GetMaterialApp(
      title: di.locator.get<Config>().applicationName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    ),
  );
}

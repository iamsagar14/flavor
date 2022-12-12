// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// 🌎 Project imports:
import 'package:flavor_core/app/routes/app_pages.dart';
import 'package:flavor_core/config/config.dart';
import 'package:flavor_core/services/locator.dart' as di;

void main() async {
  await GetStorage.init('flavor_core');
  di.initLocator();
  di.locator.get<Config>().currentFlavor = Flavor.development;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "[DEV] Flavor Core",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

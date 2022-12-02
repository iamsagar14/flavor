// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/app/routes/app_pages.dart';
import 'package:{{project_name.snakeCase()}}/config/config.dart';
import 'package:{{project_name.snakeCase()}}/services/locator.dart' as di;

void main() async {
  await GetStorage.init('{{project_name.snakeCase()}}');
  di.initLocator();
  Config.currentFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

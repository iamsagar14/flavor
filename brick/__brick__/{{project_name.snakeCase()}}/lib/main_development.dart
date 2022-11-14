// Copyright (c) {{current_year}}, Prixa Technologies

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:{{project_name.snakeCase()}}/config/config.dart';
import 'package:{{project_name.snakeCase()}}/app/routes/app_pages.dart';

void main() async {
  Config.currentFlavor = Flavor.development;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

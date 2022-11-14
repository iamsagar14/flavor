// Copyright (c) {{current_year}}, Prixa Technologies

import 'package:get/get.dart';

import 'package:{{project_name.snakeCase()}}/app/modules/home/bindings/home_binding.dart';
import 'package:{{project_name.snakeCase()}}/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

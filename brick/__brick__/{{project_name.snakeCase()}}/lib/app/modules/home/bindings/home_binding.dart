// Copyright (c) {{current_year}}, Prixa Technologies

import 'package:get/get.dart';
import 'package:{{project_name.snakeCase()}}/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

// 🐦 Flutter imports:
import 'package:{{project_name.snakeCase()}}/main_common.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(flavor: Flavor.development);
}

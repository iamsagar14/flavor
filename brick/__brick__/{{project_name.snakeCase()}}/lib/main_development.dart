// 🐦 Flutter imports:
import 'package:{{project_name.snakeCase()}}/main_common.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get_storage/get_storage.dart';

// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/config/config.dart';

void main() async {
  await GetStorage.init('{{project_name.snakeCase()}}');
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(flavor: Flavor.development);
}

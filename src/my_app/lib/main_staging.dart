// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get_storage/get_storage.dart';

// 🌎 Project imports:
import 'package:flavor_core/config/config.dart';

import 'main_common.dart';

void main() async {
  await GetStorage.init('flavor_core');
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(flavor: Flavor.staging);
}

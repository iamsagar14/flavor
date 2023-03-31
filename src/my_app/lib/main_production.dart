// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:flavor_core/config/config.dart';

import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(flavor: Flavor.production);
}

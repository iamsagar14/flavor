// 🐦 Flutter imports:
import 'package:flavor_core/main_common.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:flavor_core/config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(flavor: Flavor.development);
}

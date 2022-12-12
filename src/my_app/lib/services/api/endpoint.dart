// 🌎 Project imports:
import 'package:flavor_core/config/config.dart';
import 'package:flavor_core/services/locator.dart';

class Endpoint {
  Endpoint._();

  static final String baseUrl = locator.get<Config>().baseUrl;
}

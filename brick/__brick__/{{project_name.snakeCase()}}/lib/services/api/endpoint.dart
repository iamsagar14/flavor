// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/config/config.dart';
import 'package:{{project_name.snakeCase()}}/services/locator.dart';

class Endpoint {
  Endpoint._();

  static final String baseUrl = locator.get<Config>().baseUrl;
}

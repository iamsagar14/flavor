// 📦 Package imports:
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/config/config.dart';
import 'package:{{project_name.snakeCase()}}/services/api/base_client.dart';

GetIt locator = GetIt.instance;
void initLocator() {
  locator.registerLazySingleton(
    () => Config(),
  );

  locator.registerLazySingleton(
    () => BaseClient(),
  );
}

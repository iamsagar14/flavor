// 📦 Package imports:
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/services/api/base_client.dart';
import 'package:{{project_name.snakeCase()}}/services/managers/token_manager.dart';

GetIt locator = GetIt.instance;
void initLocator() {
  locator.registerLazySingleton(
    () => BaseClient(),
  );

  locator.registerLazySingleton(
    () => TokenManager(),
  );
}

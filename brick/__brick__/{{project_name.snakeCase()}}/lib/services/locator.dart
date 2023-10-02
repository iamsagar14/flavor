// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/services/manager/storage_manager.dart';
import 'package:{{project_name.snakeCase()}}/services/manager/token_manager.dart';
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
    () => BaseClient(config: locator()),
  );

  locator.registerSingletonAsync<Dio>(
    () => locator<BaseClient>().createDio(),
  );

  locator.registerLazySingleton(
    () => StorageManager(),
  );

  locator.registerLazySingleton(
    () => TokenManager(storageManager: locator()),
  );
}

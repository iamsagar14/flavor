// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:flavor_core/services/manager/storage_manager.dart';
import 'package:flavor_core/services/manager/token_manager.dart';
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:flavor_core/config/config.dart';
import 'package:flavor_core/services/api/base_client.dart';

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

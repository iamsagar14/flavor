// 📦 Package imports:
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:flavor_core/services/api/base_client.dart';
import 'package:flavor_core/services/managers/token_manager.dart';

GetIt locator = GetIt.instance;
void initLocator() {
  locator.registerLazySingleton(
    () => BaseClient(),
  );

  locator.registerLazySingleton(
    () => TokenManager(),
  );
}

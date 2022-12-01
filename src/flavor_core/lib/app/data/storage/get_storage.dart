// 📦 Package imports:
import 'package:get_storage/get_storage.dart';

// 🌎 Project imports:
import 'package:flavor_core/app/data/models/token.dart';

class CoreStorage {
  CoreStorage._();
  static GetStorage? storage = GetStorage('flavor_core');

  static void saveToken(Token value) {
    CoreStorage.storage?.write('token', value.toJson());
  }

  static Token? get readToken {
    if (storage!.hasData('token')) {
      return Token.fromJson(storage?.read('token'));
    } else {
      return null;
    }
  }
}

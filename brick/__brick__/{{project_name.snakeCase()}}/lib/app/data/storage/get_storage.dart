// 📦 Package imports:
import 'package:get_storage/get_storage.dart';

// 🌎 Project imports:
import 'package:{{project_name.snakeCase()}}/app/data/models/token.dart';

class CoreStorage {
  CoreStorage._();
  static GetStorage? storage = GetStorage('{{project_name.snakeCase()}}');

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

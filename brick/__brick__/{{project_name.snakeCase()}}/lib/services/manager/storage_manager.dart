import 'package:{{project_name.snakeCase()}}/app/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  static const _tokenKey = 'labelToken';

  late final FlutterSecureStorage _storage = _createStorage();
  FlutterSecureStorage _createStorage() {
    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: androidOptions);
    return storage;
  }

  void saveToken(Token value) {
    _storage.write(key: _tokenKey, value: value.toJson());
  }

  void removeToken() {
    _storage.delete(key: _tokenKey);
  }

  Future<Token?> get token async {
    final tokenString = await _storage.read(key: _tokenKey);
    if (tokenString != null) {
      return Token.fromJson(tokenString);
    } else {
      return null;
    }
  }
}

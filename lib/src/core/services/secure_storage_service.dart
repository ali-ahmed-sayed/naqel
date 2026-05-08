import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/utils.dart';

class SecureStorageService {
  SecureStorageService._();
  static final SecureStorageService instance = SecureStorageService._();

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions.defaultOptions,
  );

  FutureEither<void> write(String key, String value) async {
    return runTask(() => _storage.write(key: key, value: value));
  }

  FutureEither<String?> read(String key) async {
    return runTask(() => _storage.read(key: key));
  }

  FutureEither<void> delete(String key) async {
    return runTask(() => _storage.delete(key: key));
  }

  FutureEither<void> deleteAll() async {
    return runTask(() => _storage.deleteAll());
  }

  FutureEither<bool> containsKey(String key) async {
    return runTask(() => _storage.containsKey(key: key));
  }
}

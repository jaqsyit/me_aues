import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    return storage.read(key: 'token');
  }

  Future<String?> getUserId() async {
    return storage.read(key: 'id');
  }

  Future<String?> getSid() async {
    return storage.read(key: 'sid');
  }

  Future<String?> getCookies() async {
    return storage.read(key: 'cookie');
  }

  Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> setPersonType(String personType) async {
    await storage.write(key: 'personType', value: personType);
  }

  Future<void> setPersonId(String personId) async {
    await storage.write(key: 'personId', value: personId);
  }

  Future<void> setSid(String sid) async {
    await storage.write(key: 'sid', value: sid);
  }

  Future<void> setCookie(String cookie) async {
    await storage.write(key: 'cookie', value: cookie);
  }

  Future<void> deleteTokens() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'personType');
    await storage.delete(key: 'personId');
    await storage.delete(key: 'sid');
    await storage.delete(key: 'cookie');
  }
}

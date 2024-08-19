import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Store {
  final _storage = const FlutterSecureStorage();

  Future<bool> saveUnique({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> saveMultiple({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    return saveUnique(key: key, value: jsonEncode(value));
  }

  Future<String> readUnique({
    required String key,
    String defaultValue = '',
  }) async {
    return await _storage.read(key: key) ?? defaultValue;
  }

  Future<Map<String, dynamic>> readMultiple({
    required String key,
    Map<String, dynamic> defaultValue = const {},
  }) async {
    return jsonDecode(
      await readUnique(
        key: key,
        defaultValue: defaultValue.toString(),
      ),
    );
  }

  Future<bool> delete({required String key}) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (_) {
      return false;
    }
  }
}

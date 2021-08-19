import 'dart:convert';

import 'package:pokedex/app/shared/interfaces/interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future getList(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.getStringList(key);
  }

  @override
  Future put(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else {
      shared.setString(key, json.encode(value));
    }
  }

  @override
  Future putList(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    return shared.setStringList(key, value);
  }
}

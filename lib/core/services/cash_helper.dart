import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {

  static late SharedPreferences _preferences;

  static Future<bool> setString(String key, String value) async {

    _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(key, value);

  }

  static Future<String?> getString(String key) async {

    _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(key);

  }

  static Future<bool> setBoolean(String key, bool value) async {

    _preferences = await SharedPreferences.getInstance();
    return _preferences.setBool(key, value);

  }

  static Future<bool?> getBoolean(String key) async {

    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool(key);
  }

  static Future<bool> removeKey(String key) async {
    _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(key);
  }

}
import 'package:core/firebase/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsStorage implements LocalStorage {
  PrefsStorage._(this._prefs);

  final SharedPreferences _prefs;
  static Future<PrefsStorage> create() async =>
      PrefsStorage._(await SharedPreferences.getInstance());

  @override
  String? getString(String key) => _prefs.getString(key);
  @override
  bool? getBool(String key) => _prefs.getBool(key);
  @override
  int? getInt(String key) => _prefs.getInt(key);

  @override
  Future<void> setString(String key, String value) => _prefs.setString(key, value);
  @override
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);
  @override
  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);
  @override
  Future<void> remove(String key) => _prefs.remove(key);
}
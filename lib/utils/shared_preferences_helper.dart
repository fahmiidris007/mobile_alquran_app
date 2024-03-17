import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> setName(String name) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('name', name);
  }

  static Future<String?> getName() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('name');
  }

  static Future<void> removeName() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('name');
  }
}
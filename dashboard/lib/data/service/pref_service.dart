import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createString(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future<String> readString(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String cache = pref.getString(key) ?? '';
    return cache;
  }

  Future<void> remove(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createString(String key, String value) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString(key, value);
  }

  Future<String> readString(String key) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String cache = _pref.getString(key) ?? '';
    return cache;
  }

  Future<void> remove(String key) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove(key);
  }
}

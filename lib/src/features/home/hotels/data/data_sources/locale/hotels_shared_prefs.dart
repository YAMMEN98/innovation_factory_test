import 'package:shared_preferences/shared_preferences.dart';

class HotelsSharedPrefs {
  final SharedPreferences _preferences;

  HotelsSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

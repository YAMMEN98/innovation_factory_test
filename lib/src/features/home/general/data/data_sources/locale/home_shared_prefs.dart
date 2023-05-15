import 'package:shared_preferences/shared_preferences.dart';

class HomeSharedPrefs {
  final SharedPreferences _preferences;

  HomeSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class FlightsSharedPrefs {
  final SharedPreferences _preferences;

  FlightsSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SearchFlightsSharedPrefs {
  final SharedPreferences _preferences;

  SearchFlightsSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

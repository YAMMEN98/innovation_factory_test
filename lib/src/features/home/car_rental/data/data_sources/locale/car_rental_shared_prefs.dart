import 'package:shared_preferences/shared_preferences.dart';

class CarRentalSharedPrefs {
  final SharedPreferences _preferences;

  CarRentalSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

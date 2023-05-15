import 'package:shared_preferences/shared_preferences.dart';

class FlightBookingSharedPrefs {
  final SharedPreferences _preferences;

  FlightBookingSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

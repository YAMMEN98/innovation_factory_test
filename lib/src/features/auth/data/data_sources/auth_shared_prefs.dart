import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/core/util/constant/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefs {
  final SharedPreferences _preferences;

  AuthSharedPrefs(this._preferences);

  /// __________ User Model __________ ///
  UserModel getUser() {
    return UserModel(token: token);
  }

  Future<void> saveUser(UserModel user) async {

    if (user.token != null) {
      saveToken(user.token!);
    }
  }

  Future<void> deleteUser() async {
  }

  /// __________ Token __________ ///
  Future<void> saveToken(String? tokenValue) async {
    _preferences.setString(token, tokenValue ?? "");
  }

  String? getToken() {
    return _preferences.getString(token);
  }

  /// __________ Quick Token __________ ///
  Future<void> saveQuickToken(String? quickTokenValue) async {
    await _preferences.setString(quickToken, quickTokenValue ?? "");
  }

  String? getQuickToken() {
    return _preferences.getString(quickToken);
  }

  /// __________ Is Login __________ ///
  Future<void> saveIsLogIn(bool isLogIn) async {
    _preferences.setBool(isLogin, isLogIn);
  }

  bool getIsLogIn() {
    return _preferences.getBool(isLogin) ?? false;
  }

  /// __________ Logout __________ ///
  Future<void> logout() async {
    await saveIsLogIn(false);
    await deleteUser();
  }

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return (_preferences.clear());
  }
}

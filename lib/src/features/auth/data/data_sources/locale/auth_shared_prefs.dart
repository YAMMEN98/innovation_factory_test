import 'dart:convert';

import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/util/constant/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefs {
  final SharedPreferences _preferences;

  AuthSharedPrefs(this._preferences);

  /// __________ User Model __________ ///
  UserModel? getUser() {
    String? data = _preferences.getString(userKey);
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(json.decode(data));
  }

  Future<void> saveUser(UserModel user) async {
    await _preferences.setString(userKey, json.encode(user.toJson()));
  }

  Future<void> deleteUser() async {
    await  _preferences.remove(userKey);
  }



  /// __________ Token __________ ///
  String? getToken() {
    String? data = _preferences.getString(tokenKey);
    if (data == null) {
      return null;
    }
    return data;
  }

  Future<void> saveToken(String token) async {
    await _preferences.setString(tokenKey, token);
  }

  Future<void> deleteToken() async {
    await  _preferences.remove(tokenKey);
  }

  /// __________ Logout __________ ///
  Future<void> logout() async {
    await deleteUser();
    await deleteToken();
  }

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return (_preferences.clear());
  }

  /// __________ Remember Me __________ ///
  Future<void> setRememberMe(bool isRememberMe) async {
    await _preferences.setBool(rememberMeKey, isRememberMe);
  }

  Future<void> getRememberMe() async {
    await _preferences.getBool(rememberMeKey);
  }

  Future<void> deleteRememberMe() async {
    await _preferences.remove(rememberMeKey);
  }
}

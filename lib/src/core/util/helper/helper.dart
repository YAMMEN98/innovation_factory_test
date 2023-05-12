import 'package:innovation_factory_test/src/core/common_feature/domain/entities/login_by_enum.dart';

import '../../common_feature/data/data_sources/app_shared_prefs.dart';
import '../injections.dart';

class Helper {
  /// Get language
  static String getLang() {
    String? lang;
    lang = sl<AppSharedPrefs>().getLang();
    lang = lang ?? "en";
    return lang;
  }

  /// Get svg picture path
  static String getSvgPath(String name) {
    return "assets/svg/$name";
  }

  /// Get image picture path
  static String getImagePath(String name) {
    return "assets/images/$name";
  }

  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }

  static LoginByEnum loginBy() {
    return LoginByEnum.password;
    // if (sl<AuthSharedPrefs>().getFingerPrint()) {
    //   return LoginByEnum.fingerprint;
    // } else {
    //   if (sl<AuthSharedPrefs>().getProfile() != null && sl<AuthSharedPrefs>().getProfile()?.gesturePwd != "") {
    //     return LoginByEnum.gesturePassword;
    //   } else {
    //     return LoginByEnum.password;
    //   }
    // }
  }

  static bool isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }
}

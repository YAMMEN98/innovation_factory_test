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


  static bool isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }
}

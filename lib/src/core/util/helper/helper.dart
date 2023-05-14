import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:innovation_factory_test/src/core/common_feature/data/data_sources/app_shared_prefs.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/app_enum.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/language_enum.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';

class Helper {
  /// Get language
  static LanguageEnum getLang() {
    LanguageEnum? lang;
    lang = sl<AppSharedPrefs>().getLang();
    lang = lang ?? LanguageEnum.en;
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

  // Get Is Dark Theme Or Not
  static bool isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }

  // Get App Name
  static String getAppName() {
    return "mobile";
  }

  // Get App Name
  static AppEnum getDeviceType() {
    if(kIsWeb){
      return AppEnum.web;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return AppEnum.mobile;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      if (kIsWeb) {
        return AppEnum.web;
      } else {
        return AppEnum.desktop;
      }
    }
    return AppEnum.mobile;
  }
}

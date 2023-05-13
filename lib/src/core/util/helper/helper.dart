import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:innovation_factory_test/src/core/common_feature/data/data_sources/app_shared_prefs.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';

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


  // Get Is Dark Theme Or Not
  static bool isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }


  // Get Device Type
// Get device information asynchronously
  static Future<void> getDeviceInfo() async {
    try {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        print('Running on ${androidInfo.model}'); // e.g. "Running on Pixel 3"
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        print('Running on ${iosInfo.utsname.machine}'); // e.g. "Running on iPhone7,2"
      }
    } catch (e) {
      print('Failed to get device info: $e');
    }
  }

}

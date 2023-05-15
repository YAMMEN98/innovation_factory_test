import 'package:innovation_factory_test/src/core/common_feature/domain/entities/language_enum.dart';
import 'package:innovation_factory_test/src/core/util/constant/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  /// __________ Language __________ ///
  LanguageEnum? getLang() {
    String? langName = _preferences.getString(langKey);
    if(langName != null){
      return LanguageEnum.values.firstWhere((element) => langName == element.local);
    }
    return LanguageEnum.en;
  }

  void setLang(String local) {
    _preferences.setString(langKey, local);
  }

   deleteLang()async  {
    await _preferences.remove(langKey);
  }

  /// __________ Dark Theme __________ ///
  bool getIsDarkTheme() {
    return _preferences.getBool(theme) ?? false;
  }

  void setDarkTheme(bool isDark) {
    _preferences.setBool(theme, isDark);
  }
}

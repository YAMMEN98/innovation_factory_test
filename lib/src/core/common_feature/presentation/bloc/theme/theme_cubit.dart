import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/common_feature/data/data_sources/locale/app_shared_prefs.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(Helper.isDarkTheme());

  // Change Theme To All App And In Local Storage
  void changeLanguage(bool isDarkTheme) {
    sl<AppSharedPrefs>().setDarkTheme(isDarkTheme);
    emit(isDarkTheme);
  }
}

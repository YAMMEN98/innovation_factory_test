import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/common_feature/data/data_sources/locale/app_shared_prefs.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/language_enum.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';


class LanguageCubit extends Cubit<LanguageEnum> {
  LanguageCubit() : super(Helper.getLang());

  // Change Language To All App And In Local Storage
  void changeLanguage(LanguageEnum languageEnum){
    sl<AppSharedPrefs>().setLang(languageEnum.local);
    emit(languageEnum);
  }
}

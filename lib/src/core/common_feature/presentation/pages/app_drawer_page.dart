import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/language_enum.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/bloc/general/general_bloc.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/bloc/language/language_cubit.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/bloc/theme/theme_cubit.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/core/util/router.dart';

class AppDrawerPage extends StatefulWidget {
  const AppDrawerPage({Key? key}) : super(key: key);

  @override
  State<AppDrawerPage> createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends State<AppDrawerPage> {
  GeneralBloc _bloc = GeneralBloc();

  LanguageEnum selectedLanguage = Helper.getLang();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: kToolbarHeight,
            ),

            // Language
            Text(
              S.of(context).language,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // Arabic language
            Theme(
              data: ThemeData(
                unselectedWidgetColor: AppColors.lightGrayColor,
              ),
              child: RadioListTile(
                activeColor: AppColors.primaryColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  S.of(context).arabic,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                value: LanguageEnum.values[0],
                groupValue: selectedLanguage,
                onChanged: (value) {
                  selectedLanguage = value!;
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(selectedLanguage);
                },
              ),
            ),

            // English language
            Theme(
              data: ThemeData(
                unselectedWidgetColor: AppColors.lightGrayColor,
              ),
              child: RadioListTile(
                activeColor: AppColors.primaryColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  S.of(context).english,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                value: LanguageEnum.values[1],
                groupValue: selectedLanguage,
                onChanged: (value) {
                  selectedLanguage = value!;
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(selectedLanguage);
                },
              ),
            ),

            // Theme
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Helper.isDarkTheme()
                      ? S.of(context).dark_skin
                      : S.of(context).light_skin,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: Helper.isDarkTheme(),
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context).changeLanguage(value);
                  },
                ),
              ],
            ),

            Spacer(),

            // Logout Button
            BlocConsumer<GeneralBloc, GeneralState>(
              bloc: _bloc,
              listener: (context, state) {
                if (state is ErrorLogoutState) {
                  HelperUi.showSnackBar(context, state.errorMessage,
                      type: ToastTypeEnum.error);
                } else if (state is SuccessLogoutState) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppPageRouteName.login.name, (route) => false);
                  HelperUi.showSnackBar(
                      context, S.of(context).logout_successful,
                      type: ToastTypeEnum.success);
                }
              },
              builder: (context, state) {
                if(state is LoadingLogoutState){
                  return AppLoader();
                }
                return ButtonWidget(
                  text: S.of(context).logout,
                  onPressed: () {
                    _bloc.add(OnLogoutEvent());
                  },
                  backgroundColor: AppColors.red,
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

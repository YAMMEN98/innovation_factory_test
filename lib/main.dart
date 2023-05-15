import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/language_enum.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/bloc/language/language_cubit.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/bloc/theme/theme_cubit.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/styles/app_theme.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/core/util/log/log_controller.dart';
import 'package:innovation_factory_test/src/core/util/router.dart';
import 'package:innovation_factory_test/src/features/intro/presentation/pages/intro_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();

  sl<LogController>().initLog();

  AppSnackBar.init();
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => App(), // Wrap your app
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
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
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LanguageCubit>(
              create: (BuildContext context) => LanguageCubit(),
            ),
            BlocProvider<ThemeCubit>(
              create: (BuildContext context) => ThemeCubit(),
            ),
          ],
          child: BlocBuilder<LanguageCubit, LanguageEnum>(
            builder: (context, lang) {
              return BlocBuilder<ThemeCubit, bool>(
                builder: (context, isDarkTheme) {
                  return MaterialApp(
                    useInheritedMediaQuery: false,
                    locale: Locale(lang.local),
                    title: "Travel App",
                    onGenerateRoute: AppRouter.generateRoute,
                    theme: isDarkTheme ? darkAppTheme : appTheme,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      CountryLocalizations.delegate,
                    ],
                    navigatorKey: navigatorKey,
                    supportedLocales: const [
                      Locale("ar"),
                      Locale("en"),
                    ],
                    home: child,
                  );
                },
              );
            },
          ),
        );
      },
      child: const IntroPage(),
      // child: const SearchFlightsPage(),
    );
  }
}

import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:innovation_factory_test/src/core/common_feature/data/data_sources/app_shared_prefs.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/styles/app_theme.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/core/util/router.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/pages/register_page.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/pages/login_page.dart';
import 'package:innovation_factory_test/src/features/intro/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();
  AppSnackBar.init();
  runApp( DevicePreview(
    enabled: kReleaseMode,
    builder: (context) => App(), // Wrap your app
  ),);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();

  static void setLocale(BuildContext context, String newLocale) {
    _AppState state = context.findAncestorStateOfType()!;
    state.setState(() {
      state.locale = Locale(newLocale);
    });
    sl<AppSharedPrefs>().setLang(newLocale);
  }
}


class _AppState extends State<App> with WidgetsBindingObserver {
  Locale locale = const Locale("ar");
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    if (mounted) {
      String newLocale = Helper.getLang();
      setState(() {
        locale = Locale(newLocale);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(



      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          // Device Preview
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,


          // Real Device
          useInheritedMediaQuery: false,
          locale: locale,

          title: 'Clinic',
          scaffoldMessengerKey: snackbarKey,
          onGenerateRoute: AppRouter.generateRoute,

          theme: appTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale("ar"),
            Locale("en"),
          ],

          home: child,
        );
      },
      child: const IntroPage(),
    );



  }
}



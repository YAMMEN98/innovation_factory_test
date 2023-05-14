import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/pages/login_page.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/pages/register_page.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/pages/home_page.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/pages/search_flights_page.dart';

enum PageRouteName{
  login,
  register,
  home,
  search_flights
}


class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      // Login Page
      case '/login_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const LoginPage(),
        );

      // Register Page
      case '/register_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const RegisterPage(),
        );

    // Home Page
      case '/home_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const HomePage(),
        );

    // Search Flights Page
      case '/search_flights_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const SearchFlightsPage(),
        );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

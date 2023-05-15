import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/pages/login_page.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/pages/register_page.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/entities/flight_booking_page_params.dart';
import 'package:innovation_factory_test/src/features/booking_flight/presentation/pages/flight_booking_page.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/pages/home_page.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/entities/filtering_flights_page_params.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/pages/search_flights_page.dart';

enum AppPageRouteName {
  login,
  register,
  home,
  searchFlights,
  flightBooking,
}

extension PageRouteNameExtension on AppPageRouteName {
  String get name {
    switch (this) {
      case AppPageRouteName.login:
        return "/login_page";

      case AppPageRouteName.register:
        return "/register_page";

      case AppPageRouteName.home:
        return "/home_page";

      case AppPageRouteName.home:
        return "/home_page";

      case AppPageRouteName.searchFlights:
        return "/search_flights_page";

      case AppPageRouteName.flightBooking:
        return "/flight_booking_page";

      default:
        return "/login_page";
    }
  }
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
          builder: (_) {
            final FilteringFlightsPageParams pageParams =
                settings.arguments as FilteringFlightsPageParams;
            return SearchFlightsPage(
              params: pageParams,
            );
          },
        );

      // Flight Booking Page
      case '/flight_booking_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            final FlightBookingPageParams pageParams =
                settings.arguments as FlightBookingPageParams;
            return FlightBookingPage(
              adults: int.tryParse(pageParams.adults) ?? 0,
              children: int.tryParse(pageParams.children) ?? 0,
            );
          },
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

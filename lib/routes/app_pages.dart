import 'package:fincore/pages/auth/register_page.dart';
import 'package:fincore/pages/main_page.dart';
import 'package:fincore/pages/onboardingpage/onboarding.dart';
import 'package:fincore/pages/saved%20bracket/tournament_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/bracket/create_bracket.dart';
import '../pages/homepage/home.dart';
import '../pages/auth/login_page.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.onboarding;

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    return CupertinoPageRoute(builder: (context) {
      switch (settings.name) {
        // tabs
        case Routes.main:
          return const MainPage();
        case Routes.home:
          return const HomePage();
        case Routes.onboarding:
          return const OnBoarding();
        case Routes.login:
          return LoginPage();
        case Routes.register:
          return RegisterPage();
        case Routes.tournament:
          return TournamentListPage();
      }
      return const Scaffold(
        body: Center(
          child: Text("error page"),
        ),
      );
    });
  }
}
import 'package:fincore/pages/auth/forgot_password.dart';
import 'package:fincore/pages/auth/login.dart';
import 'package:fincore/pages/auth/new_password.dart';
import 'package:fincore/pages/auth/verification_code.dart';
import 'package:fincore/pages/homepage/home.dart';
import 'package:fincore/pages/loanprospect/add_loanprospect.dart';
import 'package:fincore/pages/loanprospect/loan_prospect.dart';
import 'package:fincore/pages/loanprospect/menu/menu_person.dart';
import 'package:fincore/pages/main_page.dart';
import 'package:fincore/pages/onboardingpage/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        case Routes.loan:
          return const LoanProspect();
        case Routes.addloan:
          return const AddLoanProspect();
        case Routes.menuperson:
          return const MenuPerson();
        // authentication
        case Routes.login:
          return const LoginPage();
        case Routes.forgotpassword:
          return const ForgotPassword();
        case Routes.verification:
          return const VerificationCode();
        case Routes.newpassword:
          return const NewPassword();
      }
      return const Scaffold(
        body: Center(
          child: Text("error page"),
        ),
      );
    });
  }
}

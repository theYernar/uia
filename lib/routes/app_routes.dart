import 'package:flutter/material.dart';
import 'package:uia/screens/main_screens/main_screens.dart';
import 'package:uia/screens/onboarding/onboarding_screen.dart';
import 'package:uia/screens/sign_up/enter_name_screen.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';

class AppRoutes {
  static const String onboardingScreeen = '/onboarding_screeen';
  static const String enterPhoneNumberScreen = '/onboarding_screeen/enter_phone_number_screen';
  static const String enterNameScreen = '/onboarding_screeen/enter_phone_number_screen/enter_name_screen';
  static const String mainScreens = '/main_screens';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreeen: (context) => OnboardingScreeen(),
    enterPhoneNumberScreen: (context) => EnterPhoneNumberScreen(),
    enterNameScreen: (context) => EnterNameScreen(),
    mainScreens: (context) => MainScreens(),
  };
}
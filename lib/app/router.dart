import 'dart:io';

import 'package:chat_gpt_app/core/presentation/screens/chat_screen.dart';
import 'package:chat_gpt_app/core/presentation/screens/home_screen.dart';
import 'package:chat_gpt_app/core/presentation/screens/onboarding_screen.dart';
import 'package:chat_gpt_app/core/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteManager {
  RouteManager._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Future<dynamic> goTo(String routeName,
      {GlobalKey<NavigatorState>? navKey, Object? arguments}) async {
    if (navKey == null) {
      return await navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      return await navKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  static Future<dynamic> replace(String routeName,
      {GlobalKey<NavigatorState>? navKey, Object? arguments}) async {
    if (navKey == null) {
      return await navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return await navKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  static Future<dynamic> replaceUntilOrAll(String routeName,
      {GlobalKey<NavigatorState>? navKey,
      String? until,
      Object? arguments}) async {
    if (navKey == null) {
      return await navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,
          (route) {
        if (until != null) {
          return route.settings.name == until;
        } else {
          return false;
        }
      }, arguments: arguments);
    } else {
      return await navKey.currentState!.pushNamedAndRemoveUntil(routeName,
          (route) {
        if (until != null) {
          return route.settings.name == until;
        } else {
          return false;
        }
      }, arguments: arguments);
    }
  }

  static void popUntil(String? routeName, {GlobalKey<NavigatorState>? navKey}) {
    if (navKey == null) {
      navigatorKey.currentState!.popUntil((route) {
        if (routeName != null) {
          return route.settings.name == routeName;
        } else {
          return false;
        }
      });
    } else {
      navKey.currentState!.popUntil((route) {
        if (routeName != null) {
          return route.settings.name == routeName;
        } else {
          return false;
        }
      });
    }
  }

  static void pop({Object? result, GlobalKey<NavigatorState>? navKey}) {
    if (navKey == null) {
      navigatorKey.currentState!.pop(result);
    } else {
      navKey.currentState!.pop(result);
    }
  }

//Global routes across the application

  static const String onboarding = '/';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String splash = '/splash';
  static Map<String, WidgetBuilder> globalRoutes = {
    onboarding: (context) => const OnboardingScreen(),
    home: (context) => const HomeScreen(),
    chat: (context) => const ChatScreen(),
    splash: (context) => const SplashScreen(),
  };
  static Route<dynamic>? Function(RouteSettings)? onGenerateGlobalRoute =
      (settings) {
    if (Platform.isAndroid) {
      return MaterialPageRoute(
        settings: settings,
        builder: globalRoutes[settings.name]!,
      );
    } else {
      return CupertinoPageRoute(
        settings: settings,
        builder: globalRoutes[settings.name]!,
      );
    }
  };
}

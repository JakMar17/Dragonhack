import 'package:flutter/material.dart';

import '../screens/registration.dart';
import '../screens/sign_in.dart';
import '../screens/splash.dart';
import '../util/logger.dart';
import 'routes.dart';

/// Provides [onGenerateRoute] function and stores current topmost route.
abstract class EPRouter {
  /// Transforms [settings] into corresponding route.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Logger.instance.info(
      'EventPayRouter.onGenerateRoute',
      'pushing route ${settings.name}',
    );

    switch (settings.name) {
      case EPRoute.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case EPRoute.signIn:
        return PageRouteBuilder(
          pageBuilder: (context, _, __) => SignInScreen(
            args: settings.arguments as SignInScreenArgs,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 850),
        );
      case EPRoute.registration:
        return PageRouteBuilder(
          pageBuilder: (context, _, __) => RegistrationScreen(
            args: settings.arguments as RegistrationScreenArgs,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 850),
        );
    }

    return null;
  }
}

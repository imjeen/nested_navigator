import 'package:flutter/material.dart';
import 'package:nested_navigator/App.dart';
import 'package:nested_navigator/screens/splash_screen.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: SplashScreen.routeName),
          builder: (_) => const SplashScreen(),
        );
      case App.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: App.routeName),
          builder: (_) => const App(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute({String? text}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(text ?? 'Something went wrong!'),
        ),
      ),
    );
  }
}

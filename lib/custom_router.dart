import 'package:flutter/material.dart';
import 'package:nested_navigator/App.dart';
import 'package:nested_navigator/screens/comments/comments_screen.dart';
import 'package:nested_navigator/screens/login/login_screen.dart';
import 'package:nested_navigator/screens/splash_screen.dart';

class CustomRouter {
  // 顶层路由
  static Route generateRoute(RouteSettings settings) {
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
      case CommentsScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: CommentsScreen.routeName),
          builder: (_) => const CommentsScreen(),
        );

      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: LoginScreen.routeName),
          builder: (_) => const LoginScreen(),
        );
      default:
        return _errorRoute(text: 'Not found route: ${settings.name}');
    }
  }

  // Tab Navigator 的嵌套路由
  static Route generateTabNestedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/nested':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/nested'),
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Nested'),
            ),
            body: const Center(
              child: Text('screen: /nested'),
            ),
          ),
        );
      default:
        return _errorRoute(text: 'Not found nested route: ${settings.name}');
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
